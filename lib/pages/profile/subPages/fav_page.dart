import 'package:excellent_trade_app/Utils/constants/app_colors.dart';
import 'package:excellent_trade_app/globalWidgets/PrimeryWidgets/my_app_bar.dart';
import 'package:flutter/material.dart';
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

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: MyAppBar(
        title: 'Favourite',
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
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
                    selectedColor: AppColors.primary,
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
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: FavFoodCard(
                      imagePath: card['imagePath'],
                      title: card['title'],
                      rating: card['rating'],
                      reviewsCount: card['reviewsCount'],
                      duration: card['duration'],
                      priceLevel: card['priceLevel'],
                      cuisine: card['cuisine'],
                      deliveryFee: card['deliveryFee'],
                      isAd: card['isAd'],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
