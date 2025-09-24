import 'package:excellent_trade_app/bloc/top_restaurant/top_restaurant_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../Utils/constants/app_colors.dart';
import '../../../../Utils/constants/appWeight.dart';
import '../../../../model/top_restaurant/top_restaurant_model.dart';
import '../../../data/response/status.dart';

class BrandList extends StatelessWidget {
  final String title;

  const BrandList({super.key, this.title = "Top Brands"});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopRestaurantBloc, TopRestaurantState>(
      builder: (context, state) {
        final response = state.apiResponse;

        if (response.status == Status.loading) {
          return SizedBox(
            height: 150,
            child: Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
                strokeWidth: 2,
              ),
            ),
          );
        }

        if (response.status == Status.error) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Center(
              child: Text(
                response.message ?? "Something went wrong",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: AppWeights.medium,
                  color: Colors.redAccent,
                ),
              ),
            ),
          );
        }

        if (state.topRestaurantModel.restaurants != null &&
            state.topRestaurantModel.restaurants!.isNotEmpty) {
          final List<Restaurant> brands = state.topRestaurantModel.restaurants!;

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title.isNotEmpty) ...[
                  Text(
                    title,
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: AppWeights.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 14),
                ],
                SizedBox(
                  height: 180, // enough for taller images
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: brands.length,
                    separatorBuilder: (context, index) =>
                    const SizedBox(width: 16),
                    itemBuilder: (context, index) {
                      final brand = brands[index];
                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 120,
                          height: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.08),
                                blurRadius: 6,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Image.network(
                                  'https://itgenesis.space/Panda_API/API/${brand.logo}' ??
                                      "https://via.placeholder.com/150",
                                  width: 120,
                                  height: 160,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stack) {
                                    return Container(
                                      color: Colors.grey.shade200,
                                      child: Icon(
                                        Icons.store,
                                        size: 40,
                                        color: AppColors.primary,
                                      ),
                                    );
                                  },
                                ),
                                // Gradient overlay
                                Container(
                                  height: 45,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.black.withOpacity(0.6),
                                        Colors.transparent,
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                    ),
                                  ),
                                ),
                                // Name text
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 6, vertical: 8),
                                  child: Text(
                                    brand.name ?? "Unknown",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      fontWeight: AppWeights.medium,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
