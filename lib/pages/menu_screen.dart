// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:excellent_trade_app/Utils/constants/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../bloc/restaurant_menu/restaurant_menu_bloc.dart';
import '../bloc/cart/cart_bloc.dart';
import '../config/routes/routes_name.dart';
import 'package:excellent_trade_app/model/restaurant_by_category/restaurant_by_category_model.dart';
import '../data/response/status.dart';
import '../model/cart/cart_model.dart';
import '../service/cart/cart_service.dart';

class MenuScreen extends StatefulWidget {
  final RestaurantData restaurantData;

  const MenuScreen({super.key, required this.restaurantData});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int selectedCategoryIndex = 0;

  @override
  void initState() {
    super.initState();
    context.read<RestaurantMenuBloc>().add(
      FetchRestaurantMenuEvent(
        restaurantId: widget.restaurantData.restaurantId,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              pinned: true,
              expandedHeight: 220,
              leading: Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.only(left: 5),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.5),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 22,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),

              actions: [
                _buildActionButton(Icons.info_outline_rounded, () {}),
                _buildActionButton(Icons.favorite_outline_rounded, () {}),
                _buildActionButton(Icons.share_outlined, () {}),
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  widget.restaurantData.restaurantLogo ?? '',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.restaurant, size: 80, color: Colors.grey);
                  },
                ),
              ),
            ),
          ];
        },
        body: SafeArea(
          top: false,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                headerWidget(),
                const TrackerWidget(),

                Padding(
                  padding: const EdgeInsets.only(top: 4.0, left: 16),
                  child: Text(
                    'Discount',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),

                SizedBox(
                  height: 130,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(left: 8, right: 8, top: 2),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: discountWidget(
                          "Get amazing discounts on your first order",
                          "20",
                          Icons.local_offer,
                        ),
                      );
                    },
                  ),
                ),

                /// search
                searchWidget(),

                BlocBuilder<RestaurantMenuBloc, RestaurantMenuState>(
                  builder: (context, state) {
                    final menu = state
                        .menus[widget.restaurantData.restaurantId]
                        ?.restaurant;

                    if (state.apiResponse.status == Status.loading &&
                        menu == null) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (state.apiResponse.status == Status.error &&
                        menu == null) {
                      return Center(
                        child: Text(state.apiResponse.message ?? "Error"),
                      );
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
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 8,
                          ),
                          height: 60,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: categories.length,
                            separatorBuilder: (_, _) =>
                                const SizedBox(width: 12),
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
                                    horizontal: 18,
                                    vertical: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? AppColors.primary
                                        : Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: isSelected
                                        ? [
                                            BoxShadow(
                                              color: AppColors.primary
                                                  .withValues(alpha: 0.4),
                                              blurRadius: 6,
                                              offset: const Offset(0, 3),
                                            ),
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
                        GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.all(16),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, // Two items per row
                                mainAxisSpacing: 16,
                                crossAxisSpacing: 16,
                                childAspectRatio: 0.75, // Control card height
                              ),
                          itemCount: selectedCategory.items.length,
                          itemBuilder: (context, index) {
                            final item = selectedCategory.items[index];
                            final cartController = CartSessionController();
                            return Container(
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  /// Item Image
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.vertical(
                                        top: Radius.circular(16),
                                      ),
                                      child: Stack(
                                        children: [
                                          Image.network(
                                            item.itemPhoto ?? "",
                                            width: double.infinity,
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (
                                                  context,
                                                  error,
                                                  stackTrace,
                                                ) => Container(
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  color: Colors.grey.shade200,
                                                  child: const Center(
                                                    child: Icon(
                                                      Icons.fastfood,
                                                      color: Colors.grey,
                                                      size:
                                                          50, // keep icon prominent but not stretched
                                                    ),
                                                  ),
                                                ),
                                          ),

                                          /// Add to cart button
                                          BlocBuilder<CartBloc, CartState>(
                                            builder: (context, cartState) {
                                              final isInCart = cartState.items
                                                  .any(
                                                    (i) =>
                                                        i.id ==
                                                        item.itemId.toString(),
                                                  );

                                              return Positioned(
                                                bottom: 8,
                                                right: 8,
                                                child: InkWell(
                                                  onTap: () {
                                                    final itemObject =
                                                        CartItemModel(
                                                          id: item.itemId
                                                              .toString(),
                                                          name: item.itemName,
                                                          price: double.parse(
                                                            item.itemPrice,
                                                          ),
                                                          quantity: 1,
                                                          imageUrl:
                                                              item.itemPhoto ??
                                                              "",
                                                          restaurantId: widget
                                                              .restaurantData
                                                              .restaurantId
                                                              .toString(),
                                                        );

                                                    if (isInCart) {
                                                      context
                                                          .read<CartBloc>()
                                                          .add(
                                                            RemoveCartItem(
                                                              item.itemId
                                                                  .toString(),
                                                            ),
                                                          );
                                                    } else {
                                                      context
                                                          .read<CartBloc>()
                                                          .add(
                                                            AddOrUpdateCartItem(
                                                              itemObject,
                                                            ),
                                                          );
                                                    }
                                                  },
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.all(6),
                                                    decoration: BoxDecoration(
                                                      color: AppColors.primary,
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Icon(
                                                      isInCart
                                                          ? Icons.check
                                                          : Icons.add,
                                                      color: Colors.white,
                                                      size: 25,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  /// Item Details
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item.itemName,
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          item.itemDescription,
                                          style: GoogleFonts.poppins(
                                            fontSize: 12,
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
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),

                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// Promo Row
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.local_offer_rounded,
                      color: AppColors.primary,
                      size: 20.sp,
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Text(
                        "Yay! Enjoy up to 20% off selected items & free delivery!",
                        style: GoogleFonts.poppins(
                          fontSize: 13.sp,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 12.h),

              /// Add to Cart Button
              SizedBox(
                width: double.infinity,
                height: 48.h,
                child: ElevatedButton.icon(
                  onPressed: () =>
                      Navigator.pushNamed(context, RoutesName.cartSection),
                  icon: const Icon(Icons.shopping_cart_outlined, size: 20),
                  label: Text(
                    "View your cart",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                    elevation: 3,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget headerWidget() => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.restaurantData.restaurantName,
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const Icon(Icons.star, color: Colors.amber, size: 20),
            const Icon(Icons.star, color: Colors.amber, size: 20),
            const Icon(Icons.star, color: Colors.amber, size: 20),
            const Icon(Icons.star_half, color: Colors.amber, size: 20),
            const Icon(Icons.star_border, color: Colors.amber, size: 20),
            const SizedBox(width: 8),
            Text(
              "3.9 ",
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "(4000+ ratings)",
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[600]),
            ),
          ],
        ),
      ],
    ),
  );

  // Reusable action button widget
  Widget _buildActionButton(IconData icon, VoidCallback onPressed) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white),
        onPressed: onPressed,
      ),
    );
  }

  Widget discountWidget(String text, String percent, IconData icon) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: AppColors.primary.withValues(alpha: 0.2)),
      ),
      color: AppColors.primary.withValues(alpha: 0.06), // Light background fill
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon and Percentage Row
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.15),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: AppColors.primary, size: 18),
                ),
                const SizedBox(width: 10),
                Text(
                  "$percent% OFF",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              text,
              style: GoogleFonts.poppins(
                fontSize: 12.5,
                fontWeight: FontWeight.w500,
                color: Colors.grey[800],
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget searchWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 12),
      child: TextFormField(
        cursorColor: Colors.black54,
        textInputAction: TextInputAction.next,
        style: GoogleFonts.poppins(fontSize: 14, color: Colors.black),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          filled: true,
          fillColor: Colors.grey.shade100,
          hintText: 'Search in menu',
          hintStyle: GoogleFonts.poppins(fontSize: 13, color: Colors.grey[600]),
          labelText: 'Search in menu',
          labelStyle: GoogleFonts.poppins(
            fontSize: 13,
            color: Colors.grey[700],
          ),
          prefixIcon: const Icon(
            Icons.search_rounded,
            size: 23,
            color: Colors.black45,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppColors.primary, width: 1.5),
          ),
        ),
      ),
    );
  }
}

class TrackerWidget extends StatefulWidget {
  const TrackerWidget({super.key});

  @override
  State<TrackerWidget> createState() => _TrackerWidgetState();
}

class _TrackerWidgetState extends State<TrackerWidget> {
  String selectedMode = 'bike';

  @override
  Widget build(BuildContext context) {
    final isBike = selectedMode == 'bike';

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: AppColors.primary.withValues(alpha: 0.2)),
      ),
      elevation: 0,
      color: AppColors.primary.withValues(alpha: 0.06), // Soft background
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Toggle Switch
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  _buildSwitchIcon(
                    icon: Icons.motorcycle_sharp,
                    selected: isBike,
                    onTap: () => setState(() => selectedMode = 'bike'),
                  ),
                  const SizedBox(width: 4),
                  _buildSwitchIcon(
                    icon: Icons.directions_walk,
                    selected: !isBike,
                    onTap: () => setState(() => selectedMode = 'walk'),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),

            // Delivery Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isBike ? "20 - 45 min delivery" : "45 - 60 min delivery",
                    style: GoogleFonts.poppins(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    isBike
                        ? "Rs. 149 or Rs. 129 with Saver\nMin. order Rs. 249"
                        : "Rs. 99 on foot\nMin. order Rs. 149",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Colors.grey[700],
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),

            // Change Button
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
              child: Text(
                "Change",
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSwitchIcon({
    required IconData icon,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: selected
              ? AppColors.primary.withValues(alpha: 0.15)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Icon(
          icon,
          size: 16,
          color: selected ? AppColors.primary : Colors.grey,
        ),
      ),
    );
  }
}

class DiscountChip extends StatelessWidget {
  final String text;
  const DiscountChip({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.orange.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.w500),
      ),
    );
  }
}

class TabItem extends StatelessWidget {
  final String text;
  final bool selected;
  const TabItem({super.key, required this.text, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? AppColors.primary : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: selected ? Colors.white : Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String price;

  const ItemCard({
    super.key,
    this.title = 'Item',
    this.subtitle = '',
    this.price = '',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              color: Colors.grey.shade100,
            ),
            child: Icon(Icons.broken_image, size: 40, color: Colors.grey),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(color: Colors.grey.shade700, fontSize: 14),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        price,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.primary,
                        ),
                        child: Text(
                          'Add',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
