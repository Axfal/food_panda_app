import 'package:excellent_trade_app/globalWidgets/PrimeryWidgets/my_app_bar.dart';
import 'package:excellent_trade_app/pages/home/home_exports.dart';
import 'package:flutter/gestures.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../bloc/location/location_bloc.dart';
import '../../../bloc/order/order_bloc.dart';
import '../../../model/delivery_address/delievery_address_model.dart';
import '../../../model/location/location_details/locations_details_model.dart';
import '../../auth/signup/signup_exports.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({super.key});

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  final TextEditingController searchController = TextEditingController();
  bool showSuggestions = false;
  GoogleMapController? _mapController;
  LatLng selectedLocation = LatLng(31.5204, 74.3587);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(
        title: 'Select Location',
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: BlocConsumer<LocationBloc, LocationState>(
          listener: (context, state) {
            if (state.locationDetailsModel.place != null) {
              final place = state.locationDetailsModel.place!;
              selectedLocation = LatLng(place.lat, place.lng);
              _mapController?.animateCamera(
                CameraUpdate.newLatLng(selectedLocation),
              );
            }
          },
          builder: (context, state) {
            return Stack(
              children: [
                /// Fullscreen Google Map
                GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: selectedLocation,
                    zoom: 15,
                  ),
                  onMapCreated: (controller) => _mapController = controller,
                  onCameraMove: (position) {
                    selectedLocation = position.target;
                  },
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  zoomControlsEnabled: false,
                  zoomGesturesEnabled: true,
                  scrollGesturesEnabled: true,
                  rotateGesturesEnabled: true,
                  tiltGesturesEnabled: false,
                  gestureRecognizers: {
                    Factory<OneSequenceGestureRecognizer>(
                      () => EagerGestureRecognizer(),
                    ),
                  },
                ),

                /// Centered Pin Marker
                Center(
                  child: Icon(
                    Icons.location_on,
                    color: Colors.redAccent,
                    size: 40.sp,
                  ),
                ),

                /// Floating Search Bar at Top
                Positioned(
                  top: 16.h,
                  left: 16.w,
                  right: 16.w,
                  child: Column(
                    children: [
                      Material(
                        elevation: 6,
                        borderRadius: BorderRadius.circular(12.r),
                        child: TextField(
                          controller: searchController,
                          style: GoogleFonts.poppins(
                            color: Colors.black87,
                            fontSize: 14.sp,
                          ),
                          cursorColor: Colors.black54,
                          decoration: InputDecoration(
                            hintText: "Search location...",
                            hintStyle: GoogleFonts.poppins(
                              color: Colors.black54,
                            ),
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Colors.black54,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 14.h,
                              horizontal: 12.w,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.r),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          onChanged: (query) {
                            if (query.isNotEmpty) {
                              showSuggestions = true;
                              context.read<LocationBloc>().add(
                                FetchLocationSuggestionEvent(query: query),
                              );
                            } else {
                              showSuggestions = false;
                            }
                            setState(() {});
                          },
                        ),
                      ),

                      /// Suggestions dropdown
                      if (showSuggestions &&
                          state.locationSuggestionModel.suggestions.isNotEmpty)
                        Container(
                          margin: EdgeInsets.only(top: 8.h),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.08),
                                blurRadius: 12,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          constraints: BoxConstraints(maxHeight: 240.h),
                          child: ListView.separated(
                            shrinkWrap: true,
                            padding: EdgeInsets.symmetric(vertical: 4.h),
                            itemCount: state.locationSuggestionModel.suggestions.length,
                            separatorBuilder: (_, _) => Divider(
                              color: Colors.grey.shade200,
                              height: 1,
                              thickness: 0.7,
                              indent: 50,
                            ),
                            itemBuilder: (context, index) {
                              final suggestion =
                              state.locationSuggestionModel.suggestions[index];

                              return InkWell(
                                borderRadius: BorderRadius.circular(12.r),
                                onTap: () {
                                  showSuggestions = false;
                                  searchController.text = suggestion.description;
                                  FocusScope.of(context).unfocus();
                                  context.read<LocationBloc>().add(
                                    FetchLocationDetailsEvent(placeId: suggestion.placeId),
                                  );
                                  setState(() {});
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(6.r),
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade100,
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Icon(
                                          Icons.location_on_outlined,
                                          color: Colors.redAccent,
                                          size: 20,
                                        ),
                                      ),
                                      SizedBox(width: 12.w),
                                      Expanded(
                                        child: Text(
                                          suggestion.description,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.poppins(
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black87,
                                            height: 1.3,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),

                    ],
                  ),
                ),

                /// Confirm Location Button at Bottom
                Positioned(
                  left: 16.w,
                  right: 16.w,
                  bottom: 30.h,
                  child: BlocConsumer<OrderBloc, OrderState>(
                    listener: (context, state) {
                      if (state.apiResponse.status == Status.error) {
                        context.flushBarErrorMessage(
                          message: state.apiResponse.message.toString(),
                        );
                      }
                      if (state.apiResponse.status == Status.completed) {
                        // You can add success handling if needed
                      }
                    },
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: () {
                          final deliveryAddress = DeliveryAddress(
                            lat: selectedLocation.latitude,
                            lng: selectedLocation.longitude,
                          );
                          Navigator.pop(context, deliveryAddress);
                        },

                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 14.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          elevation: 6,
                        ),
                        child: Text(
                          "Confirm Location",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
