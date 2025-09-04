import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../Utils/constants/appWeight.dart';
import '../../../../Utils/constants/app_colors.dart';
import '../../../../data/response/status.dart';
import '../../../../service/location/location_storage.dart';
import '../cards/large_foodCard.dart';
import '../../../../bloc/near_by_restaurant/near_by_restaurant_bloc.dart';

class ExploreWidget extends StatelessWidget {
  const ExploreWidget({super.key});

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
            child: Center(
              child: CupertinoActivityIndicator(color: Colors.black54),
            ),
          );
        }

        if (state.apiResponse.status == Status.error) {
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
                        final locationSessionController =
                            LocationSessionController();
                        final lat =
                            locationSessionController.currentPlace?.lat
                                .toString() ??
                            '31.15060600';
                        final lng =
                            locationSessionController.currentPlace?.lng
                                .toString() ??
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

        if (state.apiResponse.status == Status.completed) {
          final restaurants = state.nearByRestaurantModel.restaurants;

          if (restaurants.isEmpty) {
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

          final cardsData = restaurants.map((restaurant) {
            return {
              "imagePath": restaurant.logo ?? '',
              "title": restaurant.name ?? '',
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

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section Title
              Padding(
                padding: const EdgeInsets.only(right: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Text(
                        "Nearby Restaurants",
                        style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: AppWeights.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){},
                      child: Text(
                        "see all",
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Restaurant List
              SizedBox(
                height: 280,
                width: double.infinity,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: cardsData.length,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  separatorBuilder: (context, _) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final card = cardsData[index];
                    return SizedBox(
                      width: 350,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6.0),
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
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 12),
            ],
          );
        }

        // Fallback (should not reach here)
        return const SizedBox.shrink();
      },
    );
  }
}
