import 'package:excellent_trade_app/pages/home/home_exports.dart';
import 'package:flutter/cupertino.dart';
import '../../../../Utils/constants/appWeight.dart';
import '../cards/large_foodCard.dart';
import '../../../../bloc/near_by_restaurant/near_by_restaurant_bloc.dart';

class ExploreWidget extends StatefulWidget {
  const ExploreWidget({super.key});

  @override
  State<ExploreWidget> createState() => _ExploreWidgetState();
}

class _ExploreWidgetState extends State<ExploreWidget> {
  bool _showAll = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NearByRestaurantBloc, NearByRestaurantState>(
      buildWhen: (current, previous) =>
          current.nearByRestaurantModel != previous.nearByRestaurantModel ||
          current.apiResponse.status != previous.apiResponse.status,
      builder: (context, state) {

        if (state.apiResponse.status == Status.loading) {
          return SizedBox(
            height: 250,
            child: const Center(
              child: CupertinoActivityIndicator(color: Colors.black54),
            ),
          );
        }

        if (state.apiResponse.status == Status.error) {
          return _buildErrorState(context, state);
        }

        if (state.apiResponse.status == Status.completed) {
          final restaurants = state.nearByRestaurantModel.restaurants;

          if (restaurants.isEmpty) {
            return _buildEmptyState();
          }

          final cardsData = restaurants.map((restaurant) {
            return {
              "imagePath": restaurant.logo ?? '',
              "title": restaurant.name,
              "rating": double.tryParse(restaurant.rating.toString()) ?? 0.0,
              "reviewsCount": 10,
              "duration": '15-30 min',
              "priceLevel": '\$\$',
              "cuisine": 'Pakistani',
              "deliveryFee": 129,
              "discountLabel": '20% off',
              "isAd": true,
            };
          }).toList();

          final visibleData = _showAll ? cardsData : cardsData.take(1).toList();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section Title
              Padding(
                padding: EdgeInsets.only(right: 12.w, left: 12.w, top: 16.h),
                child: Text(
                  "Restaurants",
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                    fontWeight: AppWeights.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),

              // Restaurant List
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: visibleData.length,
                separatorBuilder: (_, _) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final card = visibleData[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: LargeFoodCard(
                      imagePath: card['imagePath'] as String,
                      title: card['title'] as String,
                      rating: card['rating'] as double,
                      reviewsCount: card['reviewsCount'] as int,
                      duration: card['duration'] as String,
                      priceLevel: card['priceLevel'] as String,
                      cuisine: card['cuisine'] as String,
                      deliveryFee: card['deliveryFee'] as int,
                      discountLabel: card['discountLabel'] as String,
                      isAd: card['isAd'] as bool,
                      onTap: () {
                    // Navigator.pushNamed(
                    // context,
                    // RoutesName.menu,
                    // arguments: {"restaurant_data": restaurantData},
                    // );
                      },
                    ),
                  );
                },
              ),

              const SizedBox(height: 8),

              // Show More / Show Less Button
              if (cardsData.length > 1)
                Center(
                  child: TextButton.icon(
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.primary,
                      side: BorderSide(color: AppColors.primary),

                      padding: EdgeInsets.symmetric(
                        horizontal: 45.w,
                        vertical: 8,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    // icon: Icon(
                    //   _showAll
                    //       ? Icons.keyboard_arrow_up_rounded
                    //       : Icons.keyboard_arrow_down_rounded,
                    //   size: 22,
                    // ),
                    label: Text(
                      _showAll ? "Show Less" : "Show More",
                      style: GoogleFonts.montserrat(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        _showAll = !_showAll;
                      });
                    },
                  ),
                ),
              const SizedBox(height: 12),
            ],
          );
        }

        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildErrorState(BuildContext context, NearByRestaurantState state) {
    return SizedBox(
      height: 250,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline_rounded,
                size: 64,
                color: Colors.red.shade400,
              ),
              const SizedBox(height: 12),
              Text(
                state.apiResponse.message ?? "Something went wrong",
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.red,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 6),
              Text(
                "Please try again later",
                style: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 12),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  elevation: 4,
                  shadowColor: AppColors.primary.withValues(alpha: 0.4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 14,
                  ),
                ),
                icon: const Icon(
                  Icons.refresh_rounded,
                  size: 20,
                  color: Colors.white,
                ),
                label: const Text(
                  "Retry",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                ),
                onPressed: () {
                  final locationSessionController = LocationSessionController();
                  final lat =
                      locationSessionController.currentPlace?.lat.toString() ??
                      '31.15060600';
                  final lng =
                      locationSessionController.currentPlace?.lng.toString() ??
                      '73.91907590';
                  context.read<NearByRestaurantBloc>().add(
                    FetchNearByRestaurantEvent(lat: lat, lng: lng),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return SizedBox(
      height: 250,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.restaurant_menu_rounded,
              size: 64,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 12),
            Text(
              "No restaurants nearby",
              style: GoogleFonts.montserrat(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              "Try adjusting your location or check back later",
              style: GoogleFonts.montserrat(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
