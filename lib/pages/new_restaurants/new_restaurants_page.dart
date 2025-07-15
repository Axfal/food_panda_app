import 'package:flutter/material.dart';
import '../../Utils/constants/app_colors.dart';
import '../../globalWidgets/PrimeryWidgets/customTopBar.dart';
import '../../globalWidgets/PrimeryWidgets/customeBottonNavBar.dart';
import '../home/widgets/cards/large_foodCard.dart';

class NewRestaurantsPage extends StatelessWidget {
  final List<Map<String, dynamic>> cardsData;

  const NewRestaurantsPage({super.key, required this.cardsData});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: const CustomBottomNavBar(
          currentIndex: 0,
          onTap: _emptyOnTap,
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Color(0xFFFFF3E0)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: Column(
            children: [
              const CustomTopBar(
                heading: 'New restaurants',
                subheading: 'Be the first to try these new restaurants',
                imagePath: 'assets/images/icons/dish_cover.jpg',
                newRes: true,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(16),
                      topLeft: Radius.circular(16),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, -2),
                      ),
                    ],
                  ),
                  child: ListView.builder(
                    itemCount: cardsData.length,
                    itemBuilder: (context, index) {
                      final card = cardsData[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        child: LargeFoodCard(
                          imagePath: card['imagePath'],
                          title: card['title'],
                          rating: card['rating'],
                          reviewsCount: card['reviewsCount'],
                          duration: card['duration'],
                          priceLevel: card['priceLevel'],
                          cuisine: card['cuisine'],
                          deliveryFee: card['deliveryFee'],
                          discountLabel: card['discountLabel'],
                          isAd: card['isAd'],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Dummy onTap to satisfy const constructor for stateless widget.
// You can replace this with a real handler if needed.
void _emptyOnTap(int index) {}
