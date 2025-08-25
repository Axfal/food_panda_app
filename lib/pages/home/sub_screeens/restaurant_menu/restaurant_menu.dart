import 'package:excellent_trade_app/Utils/constants/app_colors.dart';
import 'package:excellent_trade_app/globalWidgets/PrimeryWidgets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../bloc/restaurant_menu/restaurant_menu_bloc.dart';
import '../../../../data/response/status.dart';

class RestaurantMenu extends StatefulWidget {
  final String restaurantId;
  const RestaurantMenu({super.key, required this.restaurantId});

  @override
  State<RestaurantMenu> createState() => _RestaurantMenuState();
}

class _RestaurantMenuState extends State<RestaurantMenu> {
  int selectedCategoryIndex = 0;

  @override
  void initState() {
    super.initState();
    context.read<RestaurantMenuBloc>().add(
      FetchRestaurantMenuEvent(
        restaurantId: int.parse(widget.restaurantId),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(
        title: 'Restaurant Menu',
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: BlocBuilder<RestaurantMenuBloc, RestaurantMenuState>(
        builder: (context, state) {
          final menu = state.menus[int.parse(widget.restaurantId)]?.restaurant;

          if (state.apiResponse.status == Status.loading && menu == null) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.apiResponse.status == Status.error && menu == null) {
            return Center(child: Text(state.apiResponse.message ?? "Error"));
          }

          if (menu == null || menu.categories.isEmpty) {
            return const Center(child: Text("No menu available"));
          }

          final categories = menu.categories;
          final selectedCategory = categories[selectedCategoryIndex];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Categories (Horizontal)
              Container(
                padding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                height: 60,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    final isSelected = index == selectedCategoryIndex;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategoryIndex = index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 10),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.primary
                              : Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: isSelected
                              ? [
                            BoxShadow(
                              color: AppColors.primary.withValues(alpha: 0.4),
                              blurRadius: 6,
                              offset: const Offset(0, 3),
                            )
                          ]
                              : [],
                        ),
                        child: Center(
                          child: Text(
                            category.categoryName,
                            style: GoogleFonts.poppins(
                              color: isSelected
                                  ? Colors.white
                                  : Colors.black87,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const Divider(height: 1),

              /// Items
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: selectedCategory.items.length,
                  itemBuilder: (context, index) {
                    final item = selectedCategory.items[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          /// Item Image
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(16),
                              bottomLeft: Radius.circular(16),
                            ),
                            child: Image.network(
                              item.itemPhoto ?? "",
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  Container(
                                    height: 100,
                                    width: 100,
                                    color: Colors.grey.shade200,
                                    child: const Icon(Icons.fastfood,
                                        color: Colors.grey),
                                  ),
                            ),
                          ),

                          /// Item Details
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.itemName,
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    item.itemDescription,
                                    style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      color: Colors.black54,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    "Rs. ${item.itemPrice}",
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
