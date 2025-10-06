import 'package:excellent_trade_app/bloc/product_review/product_review_bloc.dart';
import 'package:excellent_trade_app/bloc/recommendation/recommendation_bloc.dart';
import 'package:excellent_trade_app/pages/auth/forgot_password/forget_password_export.dart';
import 'package:excellent_trade_app/pages/product_detail/widgets/product_review_widget.dart';
import 'package:excellent_trade_app/repository/auth/auth_repository.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:excellent_trade_app/model/restaurant_menu/restaurant_menu_model.dart'
    as menu_model;
import 'package:cached_network_image/cached_network_image.dart';
import '../../bloc/cart/cart_bloc.dart';
import '../../bloc/restaurant_menu/restaurant_menu_bloc.dart';
import '../../model/cart/cart_model.dart';
import '../../model/restaurant_menu_item/restaurant_menu_item_model.dart';

class ProductDetailsScreen extends StatefulWidget {
  final menu_model.MenuItem menuItem;
  final int restaurantId;
  final int categoryId;
  const ProductDetailsScreen({
    super.key,
    required this.restaurantId,
    required this.menuItem,
    required this.categoryId,
  });

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  String selectedVariation = 'Full';
  bool _showAllRecommendations = false;
  final Map<int, bool> _selected = {};

  @override
  void initState() {
    super.initState();

    context.read<RecommendationBloc>().add(
      FetchRecommendedItemsEvent(
        cartItem: [widget.menuItem.itemId],
        restaurantId: widget.restaurantId.toString(),
      ),
    );

    context.read<RestaurantMenuBloc>().add(
      FetchRestaurantMenuItemEvent(
        restaurantId: widget.restaurantId,
        categoryId: widget.categoryId,
      ),
    );

    context.read<ProductReviewBloc>().add(
      FetchProductReviewEvent(restaurantId: 6, menuItemId: 32),
    );

    /// Load existing cart state
    context.read<CartBloc>().add(LoadCart());
  }

  int? selectedVariationId;

  @override
  Widget build(BuildContext context) {
    final item = widget.menuItem;

    /// 15% by default jb tk response mn naheen a jata
    final double oldPrice = double.parse(item.itemPrice) * 1.15;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 300.h,
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.grey[200]),
                  child: CachedNetworkImage(
                    imageUrl: item.itemPhoto,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.grey[400],
                      ),
                    ),
                    errorWidget: (context, url, error) => Center(
                      child: Icon(
                        Icons.broken_image_outlined,
                        size: 60.sp,
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                ),

                Positioned(
                  top: 55.h,
                  left: 12.w,
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      height: 40.h,
                      width: 40.h,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.85),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Icon(
                        LucideIcons.x,
                        color: AppColors.black,
                        size: 25.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.itemName,
                    style: GoogleFonts.poppins(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  RichText(
                    text: TextSpan(
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        color: Colors.grey[700],
                      ),
                      children: [
                        const TextSpan(text: 'from '),
                        TextSpan(
                          text: 'Rs.${item.itemPrice} ',
                          style: GoogleFonts.poppins(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: 'Rs. $oldPrice ',
                          style: GoogleFonts.poppins(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey,
                          ),
                        ),
                        TextSpan(
                          text: '15% off',
                          style: GoogleFonts.poppins(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    "Serves 1 - 2 Person",
                    style: GoogleFonts.poppins(
                      fontSize: 14.sp,
                      color: Colors.grey[700],
                    ),
                  ),
                  // SizedBox(height: 8.h),
                ],
              ),
            ),

            BlocBuilder<RestaurantMenuBloc, RestaurantMenuState>(
              builder: (context, state) {
                final itemId = widget.menuItem.itemId;
                if (state.menuItem[widget.categoryId]?.items != null &&
                    state.menuItem[widget.categoryId]!.items!.isNotEmpty &&
                    (state
                            .menuItem[widget.categoryId]!
                            .items!
                            .first
                            .variations
                            ?.isNotEmpty ??
                        false)) {
                  return variationCardWidget(
                    context,
                    widget.categoryId,
                    itemId: itemId,
                  );
                }
                return const SizedBox.shrink();
              },
            ),

            productReviewBox(context, menuItemId: 32, restaurantId: 6),
            SizedBox(height: 8.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Frequently bought together",
                        style: GoogleFonts.poppins(
                          fontSize: 15.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        height: 25.h,
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        decoration: BoxDecoration(
                          color: Colors.grey.withValues(alpha: .4),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: Text(
                            'Optional',
                            style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              color: Colors.black54,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Other customers also order these",
                    style: GoogleFonts.poppins(color: Colors.black54),
                  ),
                ],
              ),
            ),
            BlocBuilder<RecommendationBloc, RecommendationState>(
              builder: (context, state) {
                if (state.apiResponse.status == Status.loading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state.apiResponse.status == Status.error) {
                  return Center(
                    child: Text(state.apiResponse.message ?? "Error"),
                  );
                } else if (state.apiResponse.status == Status.completed &&
                    state.recommendedItemModel.recommendations?.isNotEmpty ==
                        true) {
                  final items = state.recommendedItemModel.recommendations!;
                  final visibleItems = _showAllRecommendations
                      ? items
                      : items.take(3).toList();

                  return Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: visibleItems.length,
                        itemBuilder: (context, index) {
                          final item = visibleItems[index];
                          return optionalItemsWidget(
                            index: index,
                            title: item.name ?? "Unnamed",
                            price: "Rs. ${item.price}",
                            original:
                                "Rs. ${(double.tryParse(item.price ?? '0') ?? 0) * 1.15}",
                            photo: item.photo,
                          );
                        },
                      ),

                      if (items.length > 3)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                _showAllRecommendations =
                                    !_showAllRecommendations;
                              });
                            },
                            child: Row(
                              children: [
                                Icon(
                                  _showAllRecommendations
                                      ? Icons.keyboard_arrow_up
                                      : Icons.keyboard_arrow_down,
                                  size: 30,
                                  color: Colors.black,
                                ),
                                Text(
                                  _showAllRecommendations
                                      ? "View Less"
                                      : "View ${items.length - 3} more",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  );
                }
                return const Center(child: Text("No recommendations found"));
              },
            ),
            SizedBox(height: 18.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Divider(thickness: 1, color: Colors.black12),
            ),
            SizedBox(height: 8.h),
            instructionWidget(),
          ],
        ),
      ),
      bottomNavigationBar: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          final item = widget.menuItem;
          CartItemModel? existingItem;

          if (state is CartLoaded) {
            existingItem = state.items.firstWhere(
              (i) => i.id == item.itemId.toString(),
              orElse: () =>
                  CartItemModel(id: '', name: '', price: 0, restaurantId: ''),
            );
            if (existingItem.id.isEmpty) existingItem = null;
          }

          final quantity = existingItem?.quantity ?? 1;
          final isInCart = existingItem != null;
          final bloc = context.read<RestaurantMenuBloc>();

          final int itemId = item.itemId;
          final items = bloc.state.menuItem[widget.categoryId]?.items;
          final itemVariation = items?.firstWhere(
            (item) => item.id == itemId,
            orElse: () => Items(),
          );

          final bool haveVariations =
              itemVariation?.variations != null &&
              itemVariation!.variations!.isNotEmpty;

          return BottomAppBar(
            color: Colors.white,
            elevation: 12,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 8.w),

                /// Quantity Control
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    counterWidget(Icons.remove, () {
                      if (isInCart && quantity > 1) {
                        context.read<CartBloc>().add(
                          UpdateCartItemQuantity(
                            item.itemId.toString(),
                            quantity - 1,
                          ),
                        );
                      }
                    }),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: Text(
                        "$quantity",
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    counterWidget(Icons.add, () {
                      if (isInCart) {
                        context.read<CartBloc>().add(
                          UpdateCartItemQuantity(
                            item.itemId.toString(),
                            quantity + 1,
                          ),
                        );
                      }
                    }),
                  ],
                ),

                /// Add / Remove Cart Button
                SizedBox(
                  height: 45.h,
                  child: ElevatedButton.icon(
                    onPressed: (!haveVariations || selectedVariationId != null)
                        ? () {
                            if (isInCart) {
                              // Remove from cart
                              context.read<CartBloc>().add(
                                RemoveCartItem(item.itemId.toString()),
                              );
                            } else {
                              // Add to cart
                              final newCartItem = CartItemModel(
                                id: item.itemId.toString(),
                                name: item.itemName,
                                price: double.parse(item.itemPrice),
                                variationId: selectedVariationId,
                                restaurantId: widget.restaurantId.toString(),
                                imageUrl: item.itemPhoto,
                                quantity: 1,
                              );
                              context.read<CartBloc>().add(
                                AddOrUpdateCartItem(newCartItem),
                              );
                            }
                          }
                        : null, // disabled if variations exist but none selected

                    icon: Icon(
                      isInCart
                          ? Icons.delete_outline
                          : Icons.shopping_cart_outlined,
                      size: 18,
                    ),

                    label: Text(
                      isInCart ? "Remove from Cart" : "Add to Cart",
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                    ),

                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          (!haveVariations || selectedVariationId != null)
                          ? (isInCart ? Colors.red : AppColors.primary)
                          : Colors.grey.shade400,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                    ),
                  ),
                ),

                SizedBox(width: 4.w),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget instructionWidget() => Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Special Instructions",
          style: GoogleFonts.poppins(
            fontSize: 16.sp,
            color: Colors.black87,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          "Let us know if you have allergies or want us to avoid anything.",
          style: GoogleFonts.poppins(fontSize: 13.sp, color: Colors.black54),
        ),
        SizedBox(height: 18.h),
        TextField(
          maxLines: 3,
          cursorColor: Colors.black87,
          keyboardType: TextInputType.text,
          style: GoogleFonts.poppins(fontSize: 13.sp),
          decoration: InputDecoration(
            // labelText: 'Instruction',
            hintText: 'e.g. No mayo, extra spicy',
            hintStyle: GoogleFonts.poppins(color: Colors.grey),
            labelStyle: GoogleFonts.poppins(color: Colors.black87),
            filled: true,
            fillColor: Colors.grey.shade100,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 12.h,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: Colors.black),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: AppColors.primary),
            ),
          ),
        ),
      ],
    ),
  );

  Widget counterWidget(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Icon(icon, size: 20.sp, color: Colors.black87),
      ),
    );
  }

  Widget variationCardWidget(
    BuildContext context,
    int categoryId, {
    required int itemId,
  }) {
    final bloc = context.read<RestaurantMenuBloc>();
    final menuItem = bloc.state.menuItem[categoryId];

    if (menuItem == null || menuItem.items == null || menuItem.items!.isEmpty) {
      return const SizedBox.shrink();
    }

    // Find item by ID safely
    final Items? item = menuItem.items!.firstWhere(
      (element) => element.id == itemId,
      orElse: () => Items(variations: []),
    );

    final variations = item?.variations ?? [];

    if (variations.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: AppColors.primary.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.primary.withValues(alpha: 0.4),
            width: 1.2,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Variation",
                  style: GoogleFonts.poppins(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ),

                /// Tag
                Container(
                  height: 25.h,
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Text(
                      'Required',
                      style: GoogleFonts.poppins(
                        fontSize: 12.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 4.h),
            Text(
              'Select one',
              style: GoogleFonts.poppins(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.black,
              ),
            ),
            SizedBox(height: 6.h),

            /// Dynamic list of variations
            ...variations.map(
              (v) => variationTile(
                id: v.id,
                title: v.name ?? '',
                price: 'Rs. ${v.price ?? ''}',
                original: 'Rs. ${v.price ?? ''}',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget variationTile({
    required int? id,
    required String title,
    required String price,
    required String original,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Radio<int>(
        value: id ?? -1,
        groupValue: selectedVariationId,
        onChanged: (value) {
          setState(() {
            selectedVariationId = value;
          });
        },
        activeColor: AppColors.primary,
        fillColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.selected)) {
            return AppColors.primary;
          }
          return Colors.black;
        }),
      ),
      title: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 14.sp,
          color: Colors.black87,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            price,
            style: GoogleFonts.poppins(
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
              fontSize: 13.sp,
            ),
          ),
          Text(
            original,
            style: GoogleFonts.poppins(
              decoration: TextDecoration.lineThrough,
              fontSize: 11.sp,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget optionalItemsWidget({
    required int index,
    required String title,
    required String price,
    required String original,
    String? photo,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Checkbox(
          value: _selected[index] ?? false,
          onChanged: (value) {
            setState(() {
              _selected[index] = value ?? false;
            });
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(1.r),
          ),
          activeColor: AppColors.primary,
          checkColor: Colors.white,
          side: BorderSide(color: AppColors.primary, width: 1.5),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity.compact,
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: photo != null && photo.isNotEmpty
                  ? Image.network(
                      '${AppUrl.baseUrl}/$photo',
                      height: 40.sp,
                      width: 40.sp,
                      fit: BoxFit.cover,
                    )
                  : Icon(
                      Icons.fastfood,
                      size: 28.sp,
                      color: Colors.deepOrangeAccent,
                    ),
            ),
            SizedBox(width: 12.w),
            Flexible(
              child: Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 14.5.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ],
        ),

        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              price,
              style: GoogleFonts.poppins(
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
                fontSize: 13.sp,
              ),
            ),
            SizedBox(height: 2.h),
            Text(
              original,
              style: GoogleFonts.poppins(
                fontSize: 11.sp,
                color: Colors.grey,
                decoration: TextDecoration.lineThrough,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
