import 'package:excellent_trade_app/Utils/constants/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Utils/constants/appWeight.dart';
import '../../data/card_data.dart';
import 'widgets/favourites/fav_card.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({super.key});

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  String selectedMode = 'Delivery';

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> favCards = foodCards
        .where((card) => card['isFav'] == true)
        // .where((card) => card['mode'] == selectedMode)
        .toList();

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          toolbarHeight: 50,
          titleSpacing: 0,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.arrow_back, size: 20),
                ),
                const SizedBox(width: 4),
                Text(
                  "Favourites",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: AppWeights.semiBold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () => {},
                  child: const Icon(CupertinoIcons.bag, size: 18),
                ),
              ],
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: Container(
              color: AppColors.textSecondary.withOpacity(0.25),
              height: 1,
            ),
          ),
        ),

        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Wrap(
                  spacing: 8,
                  children: ['Delivery', 'Pick-up'].map((mode) {
                    final isSelected = selectedMode == mode;
                    return ChoiceChip(
                      showCheckmark: false,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      label: Text(mode),
                      selected: isSelected,
                      onSelected: (_) {
                        setState(() {
                          selectedMode = mode;
                        });
                      },
                      selectedColor: AppColors.black.withOpacity(0.80),
                      backgroundColor: Colors.grey[200],
                      labelStyle: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: ListView.builder(
                  itemCount: favCards.length,
                  itemBuilder: (context, index) {
                    final card = favCards[index];
                    return FavFoodCard(
                      imagePath: card['imagePath'],
                      title: card['title'],
                      rating: card['rating'],
                      reviewsCount: card['reviewsCount'],
                      duration: card['duration'],
                      priceLevel: card['priceLevel'],
                      cuisine: card['cuisine'],
                      deliveryFee: card['deliveryFee'],
                      isAd: card['isAd'],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
