import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../Utils/constants/appWeight.dart';
import '../../../../../Utils/constants/app_colors.dart';
import '../../../../../globalWidgets/PrimeryWidgets/customeBottonNavBar.dart';
import '../../../../data/card_data.dart';
import '../../../../data/food_card_model.dart';
import 'widgets/dish_card.dart';

class DishesOnDiscountPage extends StatelessWidget {
  const DishesOnDiscountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          flexibleSpace: SafeArea(
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey, width: 0.5),
                ),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    borderRadius: BorderRadius.circular(100),

                    child: const Icon(Icons.arrow_back, size: 20),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    "Dishes on Discount",
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: AppWeights.semiBold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: foodCards.length,
        itemBuilder: (context, index) {
          return DishDiscountCard(
            dish: FoodCardModel.fromJson(foodCards[index]),
          );
        },
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 0,
        onTap: _emptyOnTap,
      ),
    );
  }
}

void _emptyOnTap(int index) {
  // You can handle bottom nav tap actions here if needed
}
