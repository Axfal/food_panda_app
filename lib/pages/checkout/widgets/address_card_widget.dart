import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Utils/constants/app_colors.dart';
import '../../../model/delivery_address/delievery_address_model.dart';

class AddressCardWidget extends StatelessWidget {
  final TextEditingController houseNoController;
  final TextEditingController streetController;
  final TextEditingController cityController;
  final VoidCallback onConfirm;
  final VoidCallback? onClear;
  final DeliveryAddress? initialLocation;

  const AddressCardWidget({
    super.key,
    required this.houseNoController,
    required this.streetController,
    required this.cityController,
    required this.onConfirm,
    this.initialLocation,
    this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    // Prefill fields only if controllers are empty to avoid overwriting user input
    if (initialLocation != null) {
      if (houseNoController.text.isEmpty) {
        houseNoController.text = initialLocation!.houseNo;
      }
      if (streetController.text.isEmpty) {
        streetController.text = initialLocation!.street;
      }
      if (cityController.text.isEmpty) {
        cityController.text = initialLocation!.city;
      }
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
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
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header
            Row(
              children: [
                Icon(Icons.location_on_outlined, color: AppColors.primary),
                SizedBox(width: 8.w),
                Text(
                  'Delivery Address',
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Spacer(),
                if (onClear != null)
                  IconButton(
                    icon: Icon(Icons.clear, color: Colors.redAccent),
                    onPressed: onClear,
                  ),
              ],
            ),
            SizedBox(height: 16.h),

            /// House No
            _addressField(
              controller: houseNoController,
              label: "House No",
              hint: "e.g. 123",
              icon: Icons.home_outlined,
            ),
            SizedBox(height: 12.h),

            /// Street
            _addressField(
              controller: streetController,
              label: "Street",
              hint: "e.g. Street 4",
              icon: Icons.signpost_outlined,
            ),
            SizedBox(height: 12.h),

            /// City
            _addressField(
              controller: cityController,
              label: "City",
              hint: "e.g. Okara",
              icon: Icons.location_city_outlined,
            ),

            SizedBox(height: 20.h),

            /// Confirm Button
            SizedBox(
              width: double.infinity,
              height: 50.h,
              child: ElevatedButton(
                onPressed: onConfirm,
                style: ElevatedButton.styleFrom(
                  elevation: 3,
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: Text(
                  "Google Map",
                  style: GoogleFonts.poppins(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _addressField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
  }) {
    return TextField(
      controller: controller,
      cursorColor: Colors.black54,
      style: GoogleFonts.poppins(fontSize: 14.sp, color: Colors.black87),
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.black54),
        labelText: label,
        labelStyle: GoogleFonts.poppins(color: Colors.black54),
        hintText: hint,
        hintStyle: GoogleFonts.poppins(color: Colors.grey),
        filled: true,
        fillColor: Colors.grey.shade100,
        contentPadding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 12.w),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: AppColors.primary, width: 1.4),
        ),
      ),
    );
  }
}
