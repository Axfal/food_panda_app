import 'package:excellent_trade_app/globalWidgets/PrimeryWidgets/my_app_bar.dart';
import 'package:excellent_trade_app/pages/auth/forgot_password/forget_password_export.dart';
import 'package:excellent_trade_app/pages/home/sub_screeens/restaurant_by_category/widgets/restaurant_card.dart';
import '../../../../bloc/restaurant_by_category/restaurant_by_category_bloc.dart';
import '../../../../bloc/wish_list/wish_list_bloc.dart';

class RestaurantsByCategory extends StatefulWidget {
  final String categoryId;
  const RestaurantsByCategory({super.key, required this.categoryId});

  @override
  State<RestaurantsByCategory> createState() => _RestaurantsByCategoryState();
}

class _RestaurantsByCategoryState extends State<RestaurantsByCategory> {
  Future<void> _refreshData() async {
    context.read<RestaurantByCategoryBloc>().add(
      FetchRestaurantsByCategoryEvent(categoryId: int.parse(widget.categoryId)),
    );
  }

  @override
  void initState() {
    super.initState();
    final int categoryId = int.parse(widget.categoryId);
    context.read<RestaurantByCategoryBloc>().add(
      FetchRestaurantsByCategoryEvent(categoryId: categoryId),
    );
  }

  @override
  Widget build(BuildContext context) {
    final int categoryId = int.parse(widget.categoryId);

    return Scaffold(
      backgroundColor: const Color(0xfff8f8f8),
      appBar: MyAppBar(
        title: 'Restaurants',
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        color: Colors.white,
        backgroundColor: AppColors.primary,
        child: BlocBuilder<RestaurantByCategoryBloc, RestaurantByCategoryState>(
          builder: (context, state) {
            final restaurants =
                state.restaurantDataByCategory[categoryId] ?? [];

            switch (state.apiResponse.status) {
              case Status.loading:
                return const Center(
                  child: CircularProgressIndicator(color: AppColors.primary),
                );

              case Status.error:
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.error_outline,
                          color: Colors.red,
                          size: 48,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          state.apiResponse.message ?? "Something went wrong",
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          icon: const Icon(Icons.refresh, color: Colors.white),
                          label: const Text(
                            "Retry",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: _refreshData,
                        ),
                      ],
                    ),
                  ),
                );

              case Status.completed:
                if (restaurants.isEmpty) {
                  return const Center(
                    child: Text(
                      "No restaurants found",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                }

                return CustomScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  slivers: [
                    // Filter & Sort Bar
                    SliverToBoxAdapter(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        color: Colors.white,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              _buildChip(Icons.sort, "Sort"),
                              const SizedBox(width: 8),
                              _buildChip(Icons.filter_list, "Filter"),
                              const SizedBox(width: 8),
                              _buildChip(Icons.eco, "Pure Veg"),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Restaurant list
                    SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        final RestaurantData restaurantData =
                            restaurants[index];
                        final restaurantId = restaurantData.restaurantId;
                        final userId = SessionController.user.id.toString();

                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                RoutesName.menu,
                                arguments: {"restaurant_data": restaurantData},
                              );
                            },
                            child:
                                BlocSelector<WishListBloc, WishListState, bool>(
                                  selector: (wishListState) {
                                    final currentWishList =
                                        wishListState.wishListModel.restaurants;
                                    return currentWishList.any(
                                      (r) => r.id == restaurantId,
                                    );
                                  },
                                  builder: (context, inWishList) {
                                    return RestaurantCard(
                                      imagePath:
                                          restaurantData.restaurantLogo ?? "",
                                      title: restaurantData.restaurantName,
                                      rating: 4.5,
                                      reviewsCount: 120,
                                      duration: "30 min",
                                      priceLevel: "\$\$",
                                      cuisine: "Italian, Pizza",
                                      deliveryFee: 150,
                                      discountLabel: "30% OFF",
                                      inWishList: inWishList,
                                      onFavouriteTap: () {
                                        if (inWishList) {
                                          context.read<WishListBloc>().add(
                                            RemoveWishListEvent(
                                              userId: userId,
                                              restaurantId: restaurantId
                                                  .toString(),
                                            ),
                                          );
                                        } else {
                                          context.read<WishListBloc>().add(
                                            AddWishListEvent(
                                              userId: userId,
                                              restaurantId: restaurantId
                                                  .toString(),
                                            ),
                                          );
                                        }
                                      },
                                    );
                                  },
                                ),
                          ),
                        );
                      }, childCount: restaurants.length),
                    ),
                  ],
                );
            }
          },
        ),
      ),
    );
  }

  Widget _buildChip(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.black87),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
