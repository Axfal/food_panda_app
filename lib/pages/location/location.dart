import 'package:excellent_trade_app/bloc/auth/auth_exports.dart';
import 'package:excellent_trade_app/config/components/round_button_widget.dart';
import 'package:excellent_trade_app/config/routes/route_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:excellent_trade_app/globalWidgets/PrimeryWidgets/my_app_bar.dart';
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

  @override
  void initState() {
    super.initState();
    context.read<LocationBloc>().add(
      const FetchLocationSuggestionEvent(query: ''),
    );
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
      body: Column(
        children: [
          // Search Box
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

          // Suggestions List
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

                final suggestions = state.locationSuggestionModel.suggestions;

                if (suggestions.isEmpty) {
                  return const Center(child: Text('No suggestions found'));
                }

                return ListView.separated(
                  itemCount: suggestions.length,
                  separatorBuilder: (_, __) => Divider(
                    color: Colors.grey.shade300,
                    height: 0,
                    indent: 56,
                  ),
                  itemBuilder: (context, index) {
                    final item = suggestions[index];
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

          // Confirm Button
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: BlocConsumer<LocationBloc, LocationState>(
                listenWhen: (current, previous) => current.locationDetailsModel != previous.locationDetailsModel,
                listener: (context, state) async {
                  if (state.apiResponse.status == Status.completed &&
                      state.locationDetailsModel.success) {
                    await LocationSessionController().saveLocation(
                      state.locationDetailsModel,
                    );

                    Navigator.pushNamedAndRemoveUntil(context, RoutesName.home, (route) => false);
                  }
                },
                builder: (context, state) {
                  return RoundButton(
                    loading: state.apiResponse.status == Status.loading,
                    title: "Confirm Location",
                    onPress: selectedPlaceId == null
                        ? null
                        : () {
                      context.read<LocationBloc>().add(
                        FetchLocationDetailsEvent(
                          placeId: selectedPlaceId!,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
