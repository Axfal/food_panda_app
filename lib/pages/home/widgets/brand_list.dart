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
                  height: 170,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: brands.length,
                    separatorBuilder: (context, index) =>
                    const SizedBox(width: 14),
                    itemBuilder: (context, index) {
                      final brand = brands[index];
                      return GestureDetector(
                        onTap: () {},
                        child: Column(
                          children: [
                            Container(
                              width: 90,
                              height: 90,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(
                                  color: AppColors.primary,
                                  width: 1.5,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  'https://itgenesis.space/Panda_API/API/${brand.logo}' ??
                                      "https://via.placeholder.com/150",
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stack) {
                                    return Icon(
                                      Icons.store,
                                      size: 40,
                                      color: AppColors.primary,
                                    );
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            SizedBox(
                              width: 90,
                              child: Text(
                                brand.name ?? "Unknown",
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                  fontWeight: AppWeights.medium,
                                  fontSize: 13,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                            ),
                          ],
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
