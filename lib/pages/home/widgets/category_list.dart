import 'package:flutter/material.dart';
import '../../../../Utils/constants/app_colors.dart';
import '../../../../Utils/constants/appWeight.dart';

class HorizontalCategoryList extends StatelessWidget {
  const HorizontalCategoryList({super.key});

  final List<Map<String, dynamic>> categories = const [
    // {
    //   'image': 'assets/images/food/Latte_and_dark_coffee1',
    //   'label': 'Pakistani',
    // },
    {
      'image': 'assets/images/food/Cheese-Paratha-Piping-Pot-Curry1.png',
      'label': 'Burgers',
    },
    {
      'image':
          'assets/images/food/historical_odyssey_fish_biryani-1701905854473_1000x1.png',
      'label': 'Pulao',
    },

    {'image': 'assets/images/food/sddefault1.png', 'label': 'Pizza'},
    {
      'image': 'assets/images/food/Cheese-Paratha-Piping-Pot-Curry1.png',
      'label': 'Biryani',
    },
    {
      'image': 'assets/images/food/Cheese-Paratha-Piping-Pot-Curry1.png',
      'label': 'Burgers',
    },
    {
      'image':
          'assets/images/food/historical_odyssey_fish_biryani-1701905854473_1000x1.png',
      'label': 'Pulao',
    },

    {'image': 'assets/images/food/sddefault1.png', 'label': 'Pizza'},
    {
      'image': 'assets/images/food/Cheese-Paratha-Piping-Pot-Curry1.png',
      'label': 'Biryani',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    categories[index]['image'],
                    width: 55,
                    height: 55,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  categories[index]['label'],
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
    );
  }
}
