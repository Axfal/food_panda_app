import 'package:flutter/material.dart';
import '../../../../Utils/constants/app_colors.dart';
import '../../../../Utils/constants/appWeight.dart';
import '../../Campaign/campain_page.dart';
import '../../Top_restaurants/top_res_page.dart';
import '../../new_restaurants/new_restaurants_page.dart';
import '../../offers/offers_page.dart';
import '../../data/card_data.dart';

class HorizontalIconList extends StatelessWidget {
  HorizontalIconList({super.key});

  final List<Map<String, dynamic>> icons = [
    {
      'image': "assets/logo/offer.png",
      'label': 'Offers',
      'page': OffersPage(),
    },
    {
      'image': "assets/images/icons/badge.png",
      'label': 'Top Restaurants',
      'page': TopRestaurantsPage(),
    },
    {
      'image': "assets/images/icons/dish_cover.jpg",
      'label': 'New Restaurants',
      'page': NewRestaurantsPage(),
    },
    {
      'image': "assets/images/icons/pick_up.png",
      'label': 'Pick-up',
      'page': NewRestaurantsPage(),
    },
    {
      'image': "assets/images/icons/homechef.png",
      'label': 'Home Chef',
      'page': CampaignPage(
        campaignImage: 'assets/images/homechef_bg.jpg',
        sheetTitle: 'Homechef Deals and Discounts',
        sheetSubtitle: 'Ghar jesa khana!',
        cardsData: foodCards,
      ),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: icons.length,
        separatorBuilder: (_, _) => const SizedBox(width: 14),
        itemBuilder: (context, index) {
          final item = icons[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => item['page']),
              );
            },
            child: Column(
              children: [
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.099),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          item['image'],
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: 80,
                  child: Text(
                    item['label'],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: AppWeights.medium,
                      fontSize: 12,
                      color: AppColors.textPrimary,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
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
