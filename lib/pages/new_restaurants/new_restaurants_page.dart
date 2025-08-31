import 'package:excellent_trade_app/globalWidgets/PrimeryWidgets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Utils/constants/app_colors.dart';
import '../../bloc/new_restaurant/new_restaurant_bloc.dart';
import '../../data/response/status.dart';
import '../../service/location/location_storage.dart';

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
      body: BlocBuilder<NewRestaurantBloc, NewRestaurantState>(
        builder: (context, state) {
          if (state.apiResponse.status == Status.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.apiResponse.status == Status.error) {
            return _buildError(state.apiResponse.message ?? "Error");
          }

          if (state.newRestaurantModel.restaurants.isEmpty) {
            return _buildEmpty();
          }

          final restaurants = state.newRestaurantModel.restaurants;

          return RefreshIndicator(
            onRefresh: () async => _fetchRestaurants(),
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: restaurants.length,
              itemBuilder: (context, index) {
                final r = restaurants[index];
                return _buildRestaurantCard(r);
              },
            ),
          );
        },
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
  Widget _buildRestaurantCard(r) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: BorderSide(color: Colors.grey.shade200, width: 1), // subtle border
      ),
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 6, // soft elevation
      shadowColor: Colors.black.withOpacity(0.08),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Restaurant Logo ---
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: r.logo != null && r.logo!.isNotEmpty
                  ? Image.network(
                r.logo!,
                width: 90,
                height: 90,
                fit: BoxFit.cover,
              )
                  : Container(
                width: 90,
                height: 90,
                color: Colors.grey[100],
                child: const Icon(Icons.restaurant, color: Colors.grey),
              ),
            ),
            const SizedBox(width: 14),

            // --- Info Section ---
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top Row (Name + Distance)
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          r.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        "${r.distance} km",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.teal,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),

                  // Description
                  Text(
                    r.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Rating + Time Row
                  Row(
                    children: [
                      // Rating Chip
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.orange.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              color: Colors.orange.withOpacity(0.3), width: 0.6),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.star,
                                color: Colors.orange, size: 16),
                            const SizedBox(width: 4),
                            Text(
                              r.rating,
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Icon(Icons.access_time,
                          size: 14, color: Colors.grey[600]),
                      const SizedBox(width: 4),
                      Text(
                        r.hours,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
