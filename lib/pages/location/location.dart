import 'package:excellent_trade_app/config/components/round_button_widget.dart';
import 'package:excellent_trade_app/config/routes/route_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:excellent_trade_app/globalWidgets/PrimeryWidgets/my_app_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../Utils/constants/app_colors.dart';
import '../../bloc/location/location_bloc.dart';
import '../../data/response/status.dart';
import '../../service/location/location_storage.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final TextEditingController _searchController = TextEditingController();
  String? selectedPlaceId;
  String? selectedDescription;
  LatLng? _currentLatLng;

  @override
  void initState() {
    super.initState();
    _determinePosition();
    context.read<LocationBloc>().add(
      const FetchLocationSuggestionEvent(query: ''),
    );
  }

  Future<void> _determinePosition() async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return;
    }

    if (permission == LocationPermission.deniedForever) return;

    Position pos = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      _currentLatLng = LatLng(pos.latitude, pos.longitude);
    });
  }

  void _onSearchChanged(String value) {
    context.read<LocationBloc>().add(
      FetchLocationSuggestionEvent(query: value),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(
        title: 'Select Location',
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // 🔍 Search Box
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: TextField(
                controller: _searchController,
                onChanged: _onSearchChanged,
                cursorColor: Colors.black87,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
                decoration: InputDecoration(
                  hintText: "Search for area, street name...",
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 13,
                    color: Colors.black54,
                  ),
                  prefixIcon: const Icon(Icons.search, color: Colors.black54),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            // 📍 Suggestions List + Current Location
            Expanded(
              child: BlocBuilder<LocationBloc, LocationState>(
                builder: (context, state) {
                  if (state.apiResponse.status == Status.loading) {
                    return const Center(child: CupertinoActivityIndicator());
                  }

                  if (state.apiResponse.status == Status.error) {
                    return Center(
                      child: Text(
                        state.apiResponse.message ?? 'Something went wrong',
                      ),
                    );
                  }

                  final suggestions =
                      state.locationSuggestionModel.suggestions;

                  return ListView.separated(
                    itemCount: suggestions.length + 1,
                    separatorBuilder: (_, __) => Divider(
                      color: Colors.grey.shade300,
                      height: 0,
                      indent: 56,
                    ),
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        // ✅ Always show Current Location on top
                        return ListTile(
                          leading: Icon(Icons.my_location,
                              color: AppColors.primary, size: 22),
                          title: Text(
                            "Use Current Location",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                          trailing: selectedPlaceId == "current_location"
                              ? CircleAvatar(
                            radius: 12,
                            backgroundColor: AppColors.primary,
                            child: const Icon(
                              Icons.check,
                              size: 20,
                              color: Colors.white,
                            ),
                          )
                              : null,
                          onTap: () {
                            setState(() {
                              selectedPlaceId = "current_location";
                              selectedDescription = "Current Location";
                            });
                          },
                        );
                      }

                      final item = suggestions[index - 1];
                      return ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 4,
                        ),
                        leading: Icon(
                          Icons.location_on,
                          color: AppColors.primary,
                          size: 22,
                        ),
                        title: Text(
                          item.description,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                        trailing: selectedPlaceId == item.placeId
                            ? CircleAvatar(
                          radius: 12,
                          backgroundColor: AppColors.primary,
                          child: const Icon(
                            Icons.check,
                            size: 20,
                            color: Colors.white,
                          ),
                        )
                            : null,
                        onTap: () {
                          setState(() {
                            selectedPlaceId = item.placeId;
                            selectedDescription = item.description;
                          });
                        },
                      );
                    },
                  );
                },
              ),
            ),

            // ✅ Confirm Button
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                child: BlocConsumer<LocationBloc, LocationState>(
                  listenWhen: (prev, curr) =>
                  prev.locationDetailsModel != curr.locationDetailsModel,
                  listener: (context, state) async {
                    if (state.apiResponse.status == Status.completed &&
                        state.locationDetailsModel.success) {
                      await LocationSessionController()
                          .saveLocation(state.locationDetailsModel);

                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        RoutesName.home,
                            (route) => false,
                      );
                    }
                  },
                  builder: (context, state) {
                    return RoundButton(
                      loading: state.apiResponse.status == Status.loading,
                      title: "Confirm Location",
                      onPress: selectedPlaceId == null
                          ? null
                          : () {
                        if (selectedPlaceId == "current_location") {
                          // 🔥 Call BLoC to fetch Google Map API & save
                          context
                              .read<LocationBloc>()
                              .add(const GetCurrentLocationEvent());
                        } else {
                          context.read<LocationBloc>().add(
                            FetchLocationDetailsEvent(
                              placeId: selectedPlaceId!,
                            ),
                          );
                        }
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
