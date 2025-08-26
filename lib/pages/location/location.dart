import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:excellent_trade_app/globalWidgets/PrimeryWidgets/my_app_bar.dart';
import '../../Utils/constants/app_colors.dart';
import '../../bloc/location/location_bloc.dart';
import '../../data/response/status.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final TextEditingController _searchController = TextEditingController();
  String? selectedLocation;

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
                  separatorBuilder: (_, _) => Divider(
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
                      trailing: selectedLocation == item.description
                          ? CircleAvatar(
                              radius: 12,
                              backgroundColor: AppColors.primary,
                              child: Icon(
                                Icons.check,
                                size: 20,
                                color: Colors.white,
                              ),
                            )
                          : null,
                      onTap: () {
                        setState(() => selectedLocation = item.description);
                      },
                    );
                  },
                );
              },
            ),
          ),

          // Confirm Button
          // if (selectedLocation != null)
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: selectedLocation == null
                      ? Colors.grey.shade400
                      : AppColors.primary,
                  elevation: selectedLocation == null ? 0 : 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: selectedLocation == null
                    ? null
                    : () => Navigator.pop(context, selectedLocation),
                child: Text(
                  "Confirm Location",
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
}
