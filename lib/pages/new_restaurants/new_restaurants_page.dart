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
            backgroundColor: Colors.white,
            color: AppColors.primary,
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
    return GestureDetector(
      onTap: () {
        // TODO: Navigate to restaurant detail
      },
      child: Card(
        elevation: 2,
        color: Colors.white,
        margin: const EdgeInsets.only(bottom: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(14),
                  ),
                  child: r.logo != null && r.logo!.isNotEmpty
                      ? Image.network(
                          r.logo!,
                          height: 140,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        )
                      : Container(
                          height: 140,
                          width: double.infinity,
                          color: Colors.grey.shade100,
                          child: Icon(
                            Icons.restaurant,
                            size: 80,
                            color: Colors.black.withValues(alpha: 0.08),
                          ),
                        ),
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 16,
                    child: const Icon(
                      Icons.favorite_border,
                      size: 18,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      r.name,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.orange, size: 14),
                      const SizedBox(width: 4),
                      Text(
                        r.rating,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        " (${r.distance} km)",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
              child: Text(
                r.description,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(12, 6, 12, 12),
              child: Row(
                children: [
                  Icon(Icons.access_time, size: 14, color: Colors.grey[600]),
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
            ),
          ],
        ),
      ),
    );
  }
}
