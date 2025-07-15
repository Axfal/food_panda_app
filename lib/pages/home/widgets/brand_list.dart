import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../Utils/constants/app_colors.dart';
import '../../../../Utils/constants/appWeight.dart';

class BrandList extends StatelessWidget {
  const BrandList({super.key});

  final List<Map<String, dynamic>> Brands = const [
    {'image': 'assets/images/res_logos/burgerLab.png', 'label': 'Burger Lab'},
    {
      'image': 'assets/images/res_logos/subway.png',
      'label': 'California Pizza',
    },
    {'image': 'assets/images/res_logos/KFC_logo-image.png', 'label': 'KFC'},
    {
      'image': 'assets/images/res_logos/Starbucks_Corporation.png',
      'label': 'Broadway Pizza',
    },
    {'image': 'assets/images/res_logos/burgerLab.png', 'label': 'Burger Lab'},
    {
      'image': 'assets/images/res_logos/subway.png',
      'label': 'California Pizza',
    },
    {'image': 'assets/images/res_logos/KFC_logo-image.png', 'label': 'KFC'},
    {
      'image': 'assets/images/res_logos/Starbucks_Corporation.png',
      'label': 'Broadway Pizza',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Top Brands',
            style: GoogleFonts.montserrat(
              fontSize: 18,
              fontWeight: AppWeights.bold, // still w900
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Brands.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          Brands[index]['image'],
                          width: 80,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 7),
                      Text(
                        Brands[index]['label'],
                        style: const TextStyle(
                          fontWeight: AppWeights.medium,
                          fontSize: 12,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
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
