import 'package:excellent_trade_app/globalWidgets/PrimeryWidgets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../Utils/constants/app_colors.dart';
import '../../config/routes/routes_name.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  GoogleMapController? mapController;

  // Initial location (Example: Lahore)
  LatLng selectedLocation = LatLng(31.5204, 74.3587);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _onCameraMove(CameraPosition position) {
    setState(() {
      selectedLocation = position.target;
    });
  }

  @override
  Widget build(BuildContext context) {
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
            locationWidget(),
            DeliveryOptionWidget(
              options: [
                DeliveryOption(title: "Saver Delivery", time: "50 minutes"),
                DeliveryOption(title: "Standard Delivery", time: "30 minutes"),
                DeliveryOption(title: "Priority Delivery", time: "15 minutes"),
              ],
              onOptionSelected: (option) {
                print("Selected: ${option.title}");
                // Do whatever you want on selection change
              },
            ),
            paymentMethodWidget(),
            orderSummaryWidget(),
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
              /// Total Summary
              Container(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// Left
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
                          onTap: () {
                            // TODO: Implement summary view
                          },
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

                    /// Right
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Rs. 220.50',
                          style: GoogleFonts.poppins(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                            fontSize: 15.sp,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          "Rs. 440.50",
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

              /// Confirm Button
              SizedBox(
                width: double.infinity,
                height: 48.h,
                child: ElevatedButton.icon(
                  onPressed: () => {},
                  // Navigator.pushNamed(context, RoutesName.checkoutPayment),
                  icon: Icon(Icons.payment, size: 18.sp),
                  label: Text(
                    "Select payment method",
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
      ),
    );
  }

  Widget orderSummaryWidget() => Padding(
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

          /// Order Item
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  "1x Beef Pulao 1KG with Podina Raita",
                  style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    color: Colors.black,
                  ),
                ),
              ),
              Text(
                'Rs. 1499.40',
                style: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Divider(),

          /// Charges Breakdown
          SizedBox(height: 8.h),
          _summaryRow('Subtotal', 'Rs. 1499.40'),
          _summaryRow('Standard Delivery', 'Rs. 149.50'),
          _summaryRow('Platform Fee', 'Rs. 50.00'),
          Divider(),

          /// Voucher CTA
          SizedBox(height: 8.h),
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

  /// Reusable row widget
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
            color: Colors.black45,
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
            onTap: () {
              // Handle add payment method action
            },
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

  Widget locationWidget() => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Header Row with title and edit icon
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.location_on_outlined, color: Colors.redAccent),
                  SizedBox(width: 8.w),
                  Text(
                    'Delivery Address',
                    style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  // TODO: Navigate to detailed address edit screen
                },
                icon: Icon(Icons.edit_outlined, color: Colors.grey[700]),
              ),
            ],
          ),
          SizedBox(height: 12.h),

          /// Map preview with movable camera and marker
          SizedBox(
            height: 200.h,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: selectedLocation,
                  zoom: 15,
                ),
                onMapCreated: _onMapCreated,
                onCameraMove: _onCameraMove,
                markers: {
                  Marker(
                    markerId: MarkerId('selected-location'),
                    position: selectedLocation,
                    draggable: true,
                    onDragEnd: (newPosition) {
                      setState(() {
                        selectedLocation = newPosition;
                      });
                    },
                    icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueRed,
                    ),
                  ),
                },
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                zoomControlsEnabled: false,
              ),
            ),
          ),
          SizedBox(height: 16.h),

          /// Display selected location info (update this with reverse geocode in future)
          Text(
            "Selected Address",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            "Approximate location: ${selectedLocation.latitude.toStringAsFixed(5)}, ${selectedLocation.longitude.toStringAsFixed(5)}",
            style: GoogleFonts.poppins(
              fontSize: 13.sp,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            "City, State, Country",
            style: GoogleFonts.poppins(
              fontSize: 13.sp,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    ),
  );

  /// Step Item widget for step indicator
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
        SizedBox(height: 6.h),
        SizedBox(
          width: 60.w,
          child: Text(
            label,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 11.sp,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
              color: isActive ? AppColors.primary : Colors.black54,
            ),
          ),
        ),
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

class DeliveryOptionWidget extends StatefulWidget {
  final List<DeliveryOption> options;
  final Function(DeliveryOption) onOptionSelected;

  const DeliveryOptionWidget({
    super.key,
    required this.options,
    required this.onOptionSelected,
  });

  @override
  State<DeliveryOptionWidget> createState() => _DeliveryOptionWidgetState();
}

class _DeliveryOptionWidgetState extends State<DeliveryOptionWidget> {
  DeliveryOption? selectedOption;

  @override
  void initState() {
    super.initState();
    if (widget.options.isNotEmpty) {
      selectedOption = widget.options.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Delivery Option',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            ...widget.options.map((option) {
              final isActive = option == selectedOption;

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  decoration: BoxDecoration(
                    color: isActive
                        ? AppColors.primary.withValues(alpha: .098)
                        : Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: isActive ? AppColors.primary : Colors.transparent,
                      width: 1.5,
                    ),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        setState(() {
                          selectedOption = option;
                        });
                        widget.onOptionSelected(option);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              margin: const EdgeInsets.only(right: 12),
                              decoration: BoxDecoration(
                                color: isActive
                                    ? AppColors.primary
                                    : Colors.grey,
                                shape: BoxShape.circle,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                option.title,
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: isActive
                                      ? FontWeight.w600
                                      : FontWeight.w500,
                                  color: isActive
                                      ? AppColors.primary
                                      : Colors.black87,
                                ),
                              ),
                            ),
                            Text(
                              option.time,
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: isActive
                                    ? AppColors.primary
                                    : Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}

class DeliveryOption {
  final String title;
  final String time;

  DeliveryOption({required this.title, required this.time});
}
