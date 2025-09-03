import 'package:excellent_trade_app/config/routes/route_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../Utils/constants/app_colors.dart';
import '../../../../Utils/constants/appWeight.dart';

class PromotionalBannerWithGrid extends StatelessWidget {
  const PromotionalBannerWithGrid({super.key});

  final List<Map<String, dynamic>> restaurants = const [
    {'image': 'assets/images/res_logos/burgerLab.png', 'name': 'Burger Lab'},
    {'image': 'assets/images/res_logos/subway.png', 'name': 'California Pizza'},
    {'image': 'assets/images/res_logos/KFC_logo-image.png', 'name': 'KFC'},
    {
      'image': 'assets/images/res_logos/Starbucks_Corporation.png',
      'name': 'Broadway Pizza',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// Text Block
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 6.h),
                Text(
                  "With up to 30% off,\nFoodMate sambhal le ga!",
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                    height: 1.4,
                  ),
                ),
                SizedBox(height: 6.h),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.orderNow);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 8.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.r),
                      border: Border.all(color: Colors.white),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Order now",
                          style: GoogleFonts.poppins(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary,
                          ),
                        ),
                        SizedBox(width: 6.w),
                        Icon(
                          Icons.arrow_forward_rounded,
                          size: 16.sp,
                          color: AppColors.primary,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(width: 20.w),

          /// logo
          Image.asset('assets/logos/foodmate.png', height: 150),
        ],
      ),
    );
  }
}
