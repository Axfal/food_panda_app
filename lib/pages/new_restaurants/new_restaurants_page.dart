import 'package:excellent_trade_app/globalWidgets/PrimeryWidgets/my_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Utils/constants/app_colors.dart';
import '../../bloc/new_restaurant/new_restaurant_bloc.dart';
import '../../bloc/wish_list/wish_list_bloc.dart';
import '../../config/routes/routes_name.dart';
import '../../data/response/status.dart';
import '../../service/location/location_storage.dart';
import '../../model/restaurant_by_category/restaurant_by_category_model.dart';
import '../../service/session_manager/session_controller.dart';
import '../home/widgets/cards/large_foodCard.dart';

class NewRestaurantsPage extends StatefulWidget {
  const NewRestaurantsPage({super.key});

  @override
  State<NewRestaurantsPage> createState() => _NewRestaurantsPageState();
}

class _NewRestaurantsPageState extends State<NewRestaurantsPage> {
  late String lat;
  late String lng;

  @override
  void initState() {
    super.initState();
    final locationSessionController = LocationSessionController();
    lat = locationSessionController.currentPlace?.lat.toString() ?? "0.0";
    lng = locationSessionController.currentPlace?.lng.toString() ?? "0.0";

    _fetchRestaurants();
  }

  void _fetchRestaurants() {
    context.read<NewRestaurantBloc>().add(
      FetchNewRestaurantEvent(lat: lat, lng: lng),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: MyAppBar(
        title: 'New Restaurants',
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<NewRestaurantBloc, NewRestaurantState>(
          builder: (context, state) {
            if (state.apiResponse.status == Status.loading) {
              return const Center(
                child: CupertinoActivityIndicator(color: Colors.black54),
              );
            }

            if (state.apiResponse.status == Status.error) {
              return _buildError(state.apiResponse.message ?? "Error");
            }

            if (state.newRestaurantModel.restaurants.isEmpty) {
              return _buildEmpty();
            }

            final restaurants = state.newRestaurantModel.restaurants;

            return RefreshIndicator(
              backgroundColor: AppColors.primary,
              color: Colors.white,
              onRefresh: () async => _fetchRestaurants(),
              child: ListView.separated(
                padding: const EdgeInsets.all(12),
                itemCount: restaurants.length,
                separatorBuilder: (_, _) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final r = restaurants[index];

                  RestaurantData restaurantData = RestaurantData(
                    restaurantId: r.id,
                    restaurantName: r.name,
                    restaurantLogo: r.logo,
                  );

                  final restaurantId = r.id;

                  return BlocBuilder<WishListBloc, WishListState>(
                    builder: (context, wishListState) {
                      final currentWishList =
                          wishListState.wishListModel.restaurants;

                      final isFavourite = currentWishList.any(
                        (restaurant) => restaurant.id == restaurantId,
                      );

                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            RoutesName.menu,
                            arguments: {"restaurant_data": restaurantData},
                          );
                        },
                        child: LargeFoodCard(
                          imagePath: r.logo ?? '',
                          title: r.name,
                          rating: double.tryParse(r.rating) ?? 0.0,
                          reviewsCount: 0,
                          duration: r.hours,
                          priceLevel: "—",
                          cuisine: "",
                          deliveryFee: 0,
                          discountLabel: "",
                          isAd: false,
                          inWishList: isFavourite,
                          onFavouriteTap: () {
                            final userId = SessionController.user.id.toString();

                            if (isFavourite) {
                              context.read<WishListBloc>().add(
                                RemoveWishListEvent(
                                  userId: userId,
                                  restaurantId: restaurantId.toString(),
                                ),
                              );
                            } else {
                              context.read<WishListBloc>().add(
                                AddWishListEvent(
                                  userId: userId,
                                  restaurantId: restaurantId.toString(),
                                ),
                              );
                            }
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildError(String message) {
    return Center(
      child: Text(
        message,
        style: GoogleFonts.poppins(
          fontSize: 16,
          color: Colors.red,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildEmpty() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.search_off, size: 48, color: Colors.grey),
          SizedBox(height: 12.h),
          Text(
            'No Restaurant Found!',
            style: GoogleFonts.poppins(fontSize: 16, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
