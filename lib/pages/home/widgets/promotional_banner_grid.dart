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
      padding: const EdgeInsets.all(6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text block
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                Text(
                  "With up to 30% off,\nfoodpanda sambhal le ga!",
                  style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: AppWeights.extraBold, // still w900
                    color: AppColors.textPrimary,
                  ),
                  // const TextStyle(
                  //   fontSize: 15,
                  //   fontWeight: FontWeight.w900,
                  //   color: AppColors.textPrimary,
                  // ),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(50, 30),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: const Row(
                    children: [
                      Text(
                        "Order now",

                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.primary,
                          fontWeight: AppWeights.medium,
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.arrow_forward,
                        color: AppColors.primary,
                        size: 14,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          // 2x2 grid
          SizedBox(
            width: 100.w,
            height: 100.w,
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: restaurants.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 7,
                crossAxisSpacing: 7,
              ),
              itemBuilder: (context, index) {
                final restaurant = restaurants[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/restaurant',
                      arguments: restaurant['name'],
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.white,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.black.withOpacity(0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    // padding: const EdgeInsets.all(8),
                    child: Image.asset(restaurant['image'], fit: BoxFit.cover),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
