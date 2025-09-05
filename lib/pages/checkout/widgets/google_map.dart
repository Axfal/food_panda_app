import 'package:excellent_trade_app/pages/home/home_exports.dart';
import 'package:flutter/gestures.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../bloc/location/location_bloc.dart';
import '../../../bloc/order/order_bloc.dart';
import '../../../model/location/location_details/locations_details_model.dart';
import '../../auth/signup/signup_exports.dart';

class GoogleMapWidget extends StatefulWidget {
  const GoogleMapWidget({super.key});

  @override
  State<GoogleMapWidget> createState() => _GoogleMapWidgetState();
}

class _GoogleMapWidgetState extends State<GoogleMapWidget> {
  final TextEditingController searchController = TextEditingController();
  bool showSuggestions = false;
  GoogleMapController? _mapController;
  // final TextEditingController _controller = TextEditingController();
  LatLng selectedLocation = LatLng(31.5204, 74.3587);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
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
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.location_on_outlined, color: Colors.redAccent),
                    SizedBox(width: 8.w),
                    Text(
                      'Delivery Address',
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),

                TextField(
                  controller: searchController,
                  style: GoogleFonts.poppins(
                    color: Colors.black87,
                    fontSize: 14.sp,
                  ),
                  cursorColor: Colors.black54,
                  decoration: InputDecoration(
                    hintText: "Search location...",
                    hintStyle: GoogleFonts.poppins(color: Colors.black54),
                    prefixIcon: const Icon(Icons.search, color: Colors.black54),
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 14.h,
                      horizontal: 12.w,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14.r),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14.r),
                      borderSide: const BorderSide(
                        color: Colors.black54,
                        width: 1.2,
                      ),
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
                  },
                ),
                SizedBox(height: 10.h),

                if (showSuggestions &&
                    state.locationSuggestionModel.suggestions.isNotEmpty)
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    constraints: BoxConstraints(maxHeight: 180.h),
                    child: ListView.separated(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemCount:
                          state.locationSuggestionModel.suggestions.length,
                      separatorBuilder: (_, _) => Divider(
                        color: Colors.grey.shade300,
                        height: 1,
                        thickness: 0.8,
                      ),
                      itemBuilder: (context, index) {
                        final suggestion =
                            state.locationSuggestionModel.suggestions[index];
                        return ListTile(
                          leading: const Icon(
                            Icons.location_on_outlined,
                            color: Colors.black54,
                          ),
                          title: Text(
                            suggestion.description,
                            style: GoogleFonts.poppins(
                              fontSize: 13.sp,
                              color: Colors.black87,
                            ),
                          ),
                          onTap: () {
                            showSuggestions = false;
                            searchController.text = suggestion.description;

                            FocusScope.of(context).unfocus();

                            context.read<LocationBloc>().add(
                              FetchLocationDetailsEvent(
                                placeId: suggestion.placeId,
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),

                SizedBox(height: 12.h),

                SizedBox(
                  height: 300.h,
                  child: Stack(
                    children: [
                      GoogleMap(
                        initialCameraPosition: CameraPosition(
                          target: selectedLocation,
                          zoom: 15,
                        ),
                        onMapCreated: (controller) =>
                            _mapController = controller,
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

                      Center(
                        child: Icon(
                          Icons.location_on,
                          color: Colors.redAccent,
                          size: 40.sp,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 16.h),

                Text(
                  "Selected Address",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  "Lat: ${selectedLocation.latitude.toStringAsFixed(5)}, "
                  "Lng: ${selectedLocation.longitude.toStringAsFixed(5)}",
                  style: GoogleFonts.poppins(
                    fontSize: 13.sp,
                    color: Colors.grey[700],
                  ),
                ),

                SizedBox(height: 12.h),

                SizedBox(
                  width: double.infinity,
                  child: BlocConsumer<OrderBloc, OrderState>(
                    listener: (context, state) {
                      if (state.apiResponse.status == Status.error) {
                        context.flushBarErrorMessage(
                          message: state.apiResponse.message.toString(),
                        );
                      }
                      if(state.apiResponse.status == Status.completed){

                      }
                    },
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed: () async {
                          final place = Place(
                            placeId: "manual-selected",
                            name: "Pinned Location",
                            address: "",
                            lat: selectedLocation.latitude,
                            lng: selectedLocation.longitude,
                          );
                          final location = LocationDetailsModel(
                            success: true,
                            place: place,
                          );

                          setState(() {});
                          await LocationSessionController().saveLocation(
                            location,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                        child: Text(
                          "Confirm Location",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
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
