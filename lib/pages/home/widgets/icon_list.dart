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
      'image': "assets/images/icons/percentage.png",
      'label': 'Offers\n',
      'page': OffersPage(),
    },
    {
      'image': "assets/images/icons/badge.png",
      'label': 'Top\n Restaurants',
      'page': TopRestaurantsPage(cardsData: foodCards),
    },
    {
      'image': "assets/images/icons/dish_cover.jpg",
      'label': 'New\n restaurants',
      'page': NewRestaurantsPage(cardsData: foodCards),
    },
    {
      'image': "assets/images/icons/pick_up.png",
      'label': 'Pick-up\n',
      'page': NewRestaurantsPage(cardsData: foodCards),
    },
    {
      'image': "assets/images/icons/homechef.png",
      'label': 'Home Chef\n',
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
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: icons.length,
        itemBuilder: (context, index) {
          final item = icons[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => item['page']),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: AppColors.primary.withOpacity(0.1),
                    child: item.containsKey('icon')
                        ? Icon(item['icon'], color: AppColors.primary)
                        : item.containsKey('image')
                        ? ClipOval(
                            child: Image.asset(
                              item['image'],
                              height: 44,
                              width: 44,
                              fit: BoxFit.contain,
                            ),
                          )
                        : const SizedBox.shrink(),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    textAlign: TextAlign.center,
                    item['label'],
                    style: const TextStyle(
                      fontWeight: AppWeights.medium,
                      fontSize: 12,
                      color: AppColors.textPrimary,
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
}
