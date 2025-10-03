// ignore_for_file: avoid_print
import 'package:excellent_trade_app/bloc/auth/auth_exports.dart';
import 'package:excellent_trade_app/globalWidgets/PrimeryWidgets/my_app_bar.dart';
import 'package:excellent_trade_app/pages/checkout/widgets/address_card_widget.dart';
import 'package:excellent_trade_app/pages/checkout/widgets/payment_method_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../bloc/order/order_bloc.dart';
import '../../model/delivery_address/delievery_address_model.dart';
import '../../model/delivery_address/order_request_model.dart';
import '../../service/cart/cart_service.dart';
import '../auth/signup/signup_exports.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final houseNoController = TextEditingController();
  final streetController = TextEditingController();
  final cityController = TextEditingController();
  DeliveryAddress? deliveryAddress;
  @override
  Widget build(BuildContext context) {
    final cartController = CartSessionController();
    final subtotal = cartController.cartTotal;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        title: 'Checkout',
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    stepItem("1", "Menu", isCompleted: true),
                    stepLine(isActive: true),
                    stepItem("2", "Cart", isCompleted: true),
                    stepLine(isActive: true),
                    stepItem("3", "Checkout", isActive: true),
                  ],
                ),
              ),
            ),
            AddressCardWidget(
              houseNoController: houseNoController,
              streetController: streetController,
              cityController: cityController,
              initialLocation: deliveryAddress,
              onConfirm: () async {
                final result = await Navigator.pushNamed(
                  context,
                  RoutesName.googleMap,
                );
                if (result != null && result is DeliveryAddress) {
                  setState(() {
                    deliveryAddress = result;
                  });
                }
              },
            ),

            PaymentMethodWidget(
              options: ["Cash on Delivery", "Pay Online (Currently disable)"],
              onOptionSelected: (option) {
                print("Selected Payment Method: $option");
              },
            ),

            orderSummaryWidget(context),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total (incl. fee & tax)",
                          style: GoogleFonts.poppins(
                            fontSize: 13.sp,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "See summary",
                            style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              color: Colors.black87,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Rs. $subtotal",
                          style: GoogleFonts.poppins(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                            fontSize: 15.sp,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          "Rs. ${subtotal + 150}",
                          style: GoogleFonts.poppins(
                            fontSize: 11.sp,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 14.h),
              BlocConsumer<OrderBloc, OrderState>(
                listenWhen: (current, previous) =>
                current.apiResponse.status != previous.apiResponse.status,
                listener: (context, state) {
                  if (state.apiResponse.status == Status.error) {
                    context.flushBarErrorMessage(
                      message: state.apiResponse.message.toString(),
                    );
                  }

                  if (state.apiResponse.status == Status.completed) {
                    cartController.clearCart();
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      RoutesName.baseScreen,
                          (routes) => false,
                    );
                  }
                },
                builder: (context, state) {
                  final isLoading = state.apiResponse.status == Status.loading;

                  return SizedBox(
                    width: double.infinity,
                    height: 54.h,
                    child: ElevatedButton.icon(
                      onPressed: isLoading
                          ? null
                          : () {
                        if (deliveryAddress != null) {
                          deliveryAddress!
                            ..houseNo = houseNoController.text
                            ..street = streetController.text
                            ..city = cityController.text;

                          context.read<OrderBloc>().add(
                            CheckOutEvent(
                              customerId: SessionController.user.id,
                              restaurantId: int.parse(
                                  CartSessionController.currentRestaurantId ?? '0'),
                              totalAmount: subtotal + 150,
                              discountAmount: 150,
                              finalAmount: subtotal,
                              paymentMethod: "COD",
                              specialInstructions: "specialInstructions",
                              lat: deliveryAddress!.lat,
                              lng: deliveryAddress!.lng,
                              houseNo: deliveryAddress!.houseNo,
                              street: deliveryAddress!.street,
                              city: deliveryAddress!.city,
                              items: CartSessionController.cartItems
                                  .map(
                                    (e) => OrderItem(
                                  itemId: int.parse(e.id),
                                  itemName: e.name,
                                  quantity: e.quantity,
                                  price: e.price,
                                  discountAmount: 150,
                                  finalPrice: (e.price * e.quantity),
                                  totalPrice: (e.price * e.quantity + 150),
                                ),
                              )
                                  .toList(),
                            ),
                          );
                        } else {
                          context.flushBarErrorMessage(
                            message: "Please select a location first",
                          );
                        }
                      },
                      icon: isLoading
                          ? SizedBox(
                        width: 20.sp,
                        height: 20.sp,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2.5,
                        ),
                      )
                          : Icon(Icons.check_circle_outline, size: 25.sp),
                      label: Text(
                        isLoading ? "Processing..." : "Confirm Order",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 18.sp,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        elevation: 4,
                      ),
                    ),
                  );
                },
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget orderSummaryWidget(BuildContext context) {
    final cartController = CartSessionController();
    final cartItems = CartSessionController.cartItems;
    final subtotal = cartController.cartTotal;

    // Example: You can replace with your logic
    const double deliveryFee = 0.0;
    const double platformFee = 0.0;

    final total = subtotal + deliveryFee + platformFee;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header Row
            Row(
              children: [
                Icon(Icons.list_alt_outlined, color: Colors.black87),
                SizedBox(width: 8.w),
                Text(
                  'Order Summary',
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),

            /// Dynamic Order Items
            ...cartItems.map(
              (item) => Padding(
                padding: EdgeInsets.symmetric(vertical: 6.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        "${item.quantity}x ${item.name}",
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Text(
                      "Rs. ${(item.price * item.quantity).toStringAsFixed(2)}",
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(),

            /// Charges Breakdown
            _summaryRow('Subtotal', "Rs. ${subtotal.toStringAsFixed(2)}"),
            _summaryRow(
              'Standard Delivery',
              "Rs. ${deliveryFee.toStringAsFixed(2)}",
            ),
            _summaryRow(
              'Platform Fee',
              "Rs. ${platformFee.toStringAsFixed(2)}",
            ),
            Divider(),
            _summaryRow('Total', "Rs. ${total.toStringAsFixed(2)}"),

            /// Voucher CTA
            SizedBox(height: 12.h),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.applyForVoucher);
              },
              borderRadius: BorderRadius.circular(8.r),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(
                    color: AppColors.primary.withValues(alpha: .089),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(Icons.card_giftcard, color: AppColors.primary),
                    SizedBox(width: 10.w),
                    Text(
                      "Apply a voucher",
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _summaryRow(String title, String amount) => Padding(
    padding: EdgeInsets.symmetric(vertical: 4.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(fontSize: 14.sp, color: Colors.black45),
        ),
        Text(
          amount,
          style: GoogleFonts.poppins(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
      ],
    ),
  );

  Widget paymentMethodWidget() => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.wallet_outlined, color: Colors.black87),
              SizedBox(width: 10.w),
              Text(
                'Payment Method',
                style: GoogleFonts.poppins(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          Divider(height: 24.h, thickness: 1, color: Colors.grey.shade200),
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(12.r),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Row(
                children: [
                  Icon(Icons.add, color: AppColors.primary),
                  SizedBox(width: 10.w),
                  Text(
                    'Add a payment method',
                    style: GoogleFonts.poppins(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );

  Widget stepItem(
    String number,
    String label, {
    bool isActive = false,
    bool isCompleted = false,
  }) {
    final bgColor = (isCompleted || isActive)
        ? AppColors.primary
        : Colors.grey.shade300;

    final content = isCompleted
        ? Icon(Icons.check, color: Colors.white, size: 16.sp)
        : Text(
            number,
            style: TextStyle(
              color: Colors.white,
              fontSize: 13.sp,
              fontWeight: FontWeight.bold,
            ),
          );

    return Column(
      children: [
        CircleAvatar(radius: 16.r, backgroundColor: bgColor, child: content),
        // ),
      ],
    );
  }

  /// Step line widget connecting steps
  Widget stepLine({bool isActive = false}) {
    return Expanded(
      child: Container(
        height: 4.h,
        margin: EdgeInsets.symmetric(vertical: 16.h),
        color: isActive ? AppColors.primary : Colors.grey.shade300,
      ),
    );
  }
}
