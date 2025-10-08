import 'package:excellent_trade_app/Utils/constants/app_colors.dart';
import 'package:excellent_trade_app/config/routes/route_export.dart';
import 'package:excellent_trade_app/model/cart/cart_model.dart';
import 'package:excellent_trade_app/bloc/cart/cart_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CartSection extends StatefulWidget {
  const CartSection({super.key});

  @override
  State<CartSection> createState() => _CartSectionState();
}

class _CartSectionState extends State<CartSection> {
  @override
  void initState() {
    super.initState();
    context.read<CartBloc>().add(LoadCart());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        title: Text(
          "Cart",
          style: GoogleFonts.poppins(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),

      body: BlocBuilder<CartBloc, CartState>(
        buildWhen: (previous, current) {
          if (current is CartLoaded && previous is CartLoaded) {
            return previous.items != current.items;
          }
          return true;
        },
        builder: (context, state) {
          final cartItems = state is CartLoaded
              ? state.items
              : <CartItemModel>[];

          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 20.h,
                  ),
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        stepItem("1", "Menu", isCompleted: true),
                        stepLine(isActive: true),
                        stepItem("2", "Cart", isActive: true),
                        stepLine(isActive: false),
                        stepItem("3", "Checkout"),
                      ],
                    ),
                  ),
                ),

                estimatedDelivery(),

                if (cartItems.isEmpty)
                  Padding(
                    padding: EdgeInsets.all(20.h),
                    child: Text(
                      "Your cart is empty",
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        color: Colors.black54,
                      ),
                    ),
                  )
                else
                  ...cartItems.map((item) => itemsWidget(item)),
              ],
            ),
          );
        },
      ),

      bottomNavigationBar: BlocBuilder<CartBloc, CartState>(
        buildWhen: (previous, current) =>
            previous is CartLoaded && current is CartLoaded,
        builder: (context, state) {
          final cartItems = state is CartLoaded
              ? state.items
              : <CartItemModel>[];

          final total = cartItems.fold(
            0.0,
            (sum, item) => sum + (item.price * item.quantity),
          );

          return SafeArea(
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
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.w,
                      vertical: 12.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.05),
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
                        Text(
                          'Rs. ${total.toStringAsFixed(2)}',
                          style: GoogleFonts.poppins(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                            fontSize: 15.sp,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 14.h),

                  SizedBox(
                    width: double.infinity,
                    height: 48.h,
                    child: ElevatedButton.icon(
                      onPressed: cartItems.isEmpty
                          ? null
                          : () => Navigator.pushNamed(
                              context,
                              RoutesName.checkout,
                            ),
                      icon: Icon(Icons.location_on_outlined, size: 18.sp),
                      label: Text(
                        "Confirm payment & address",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
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
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget stepItem(
    String number,
    String label, {
    bool isActive = false,
    bool isCompleted = false,
  }) {
    final bgColor = isCompleted || isActive
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
      ],
    );
  }

  Widget stepLine({bool isActive = false}) {
    return Expanded(
      child: Container(
        height: 4.h,
        color: isActive ? AppColors.primary : Colors.grey.shade300,
      ),
    );
  }

  Widget estimatedDelivery() => Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
    child: Container(
      padding: EdgeInsets.all(14.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.delivery_dining,
              color: AppColors.primary,
              size: 24.sp,
            ),
          ),
          SizedBox(width: 14.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Estimated Delivery",
                  style: GoogleFonts.poppins(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  "Standard delivery • 50 - 70 mins",
                  style: GoogleFonts.poppins(
                    fontSize: 13.sp,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: 6.h),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Change",
                    style: GoogleFonts.poppins(
                      fontSize: 13.sp,
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );

  Widget itemsWidget(CartItemModel item) => Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
    child: Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.fastfood, color: Colors.deepOrangeAccent, size: 30.sp),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 6.h),
                Row(
                  children: [
                    counterWidget(Icons.remove, () {
                      final newQty = item.quantity - 1;
                      if (newQty <= 0) {
                        context.read<CartBloc>().add(RemoveCartItem(item.id));
                      } else {
                        context.read<CartBloc>().add(
                          UpdateCartItemQuantity(item.id, newQty),
                        );
                      }
                    }),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: Text(
                        "${item.quantity}",
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    counterWidget(Icons.add, () {
                      final newQty = item.quantity + 1;
                      context.read<CartBloc>().add(
                        UpdateCartItemQuantity(item.id, newQty),
                      );
                    }),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Rs. ${(item.price * item.quantity).toStringAsFixed(2)}',
                style: GoogleFonts.poppins(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                "Rs. ${item.price.toStringAsFixed(2)}",
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
  );

  Widget counterWidget(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: EdgeInsets.all(6.r),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Icon(icon, size: 18.sp, color: Colors.black87),
      ),
    );
  }
}
