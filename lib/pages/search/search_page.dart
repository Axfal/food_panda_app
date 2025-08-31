import 'dart:async';
import 'package:excellent_trade_app/bloc/search/search_bloc.dart';
import 'package:excellent_trade_app/pages/auth/forgot_password/forget_password_export.dart';
import 'package:excellent_trade_app/service/location/location_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../globalWidgets/PrimeryWidgets/customeBottonNavBar.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int _selectedIndex = 2;
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounce;

  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (query.trim().isEmpty) return;

      try {
        final locationSessionController = LocationSessionController();
        final lat =
            locationSessionController.currentPlace?.lat.toString() ?? "0.0";
        final lng =
            locationSessionController.currentPlace?.lng.toString() ?? "0.0";

        context.read<SearchBloc>().add(
          FetchSearchResult(query: query, lat: lat, lng: lng),
        );
      } catch (e) {
        context.flushBarErrorMessage(message: e.toString());
      }
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Search Bar
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(28.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    children: [
                      const Icon(Icons.search, color: Colors.black54),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          style: GoogleFonts.poppins(
                            fontSize: 14.sp,
                            color: Colors.black87,
                          ),
                          cursorColor: Colors.black54,
                          onChanged: _onSearchChanged,
                          decoration: InputDecoration(
                            hintText: 'Search for restaurants and groceries',
                            hintStyle: GoogleFonts.poppins(
                              color: Colors.black45,
                              fontSize: 14.sp,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      BlocBuilder<SearchBloc, SearchState>(
                        builder: (context, state) {
                          if (state.apiResponse.status == Status.loading) {
                            return const CupertinoActivityIndicator(
                              color: Colors.black54,
                            );
                          }
                          if (_searchController.text.isNotEmpty) {
                            return GestureDetector(
                              onTap: () {
                                _searchController.clear();
                                context.read<SearchBloc>().add(
                                  const FetchSearchResult(
                                    query: "",
                                    lat: "0",
                                    lng: "0",
                                  ),
                                );
                              },
                              child: const Icon(
                                Icons.close,
                                color: Colors.black45,
                              ),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 24.h),

                /// Bloc Consumer to handle states
                Expanded(
                  child: BlocConsumer<SearchBloc, SearchState>(
                    listener: (context, state) {
                      if (state.apiResponse.status == Status.error) {
                        // context.flushBarErrorMessage(
                        //   message: state.apiResponse.message.toString(),
                        // );
                      }
                    },
                    builder: (context, state) {
                      if (state.apiResponse.status == Status.loading) {
                        return const Center(
                          child: CupertinoActivityIndicator(
                            color: Colors.black54,
                          ),
                        );
                      }

                      if (state.apiResponse.status == Status.completed &&
                          state.searchModel.results.isNotEmpty) {
                        return ListView.builder(
                          itemCount: state.searchModel.results.length,
                          itemBuilder: (context, index) {
                            final item = state.searchModel.results[index];
                            return Card(
                              color: Colors.white,
                              margin: EdgeInsets.symmetric(
                                vertical: 8.h,
                                horizontal: 8.w,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                              elevation: 3,
                              child: Padding(
                                padding: EdgeInsets.all(12.w),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    /// Thumbnail/Icon
                                    Container(
                                      height: 48.w,
                                      width: 48.w,
                                      decoration: BoxDecoration(
                                        color: Colors.orange.withValues(
                                          alpha: 0.15,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          12.r,
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.restaurant,
                                        color: Colors.orange,
                                        size: 28,
                                      ),
                                    ),

                                    SizedBox(width: 12.w),

                                    /// Details
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          /// Restaurant Name
                                          Text(
                                            item.restaurantName,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.poppins(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black87,
                                            ),
                                          ),

                                          SizedBox(height: 6.h),

                                          /// Matched info as pill / fallback text
                                          if (item.matchedItem.isNotEmpty ||
                                              item.matchedCategory.isNotEmpty)
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 10.w,
                                                vertical: 4.h,
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.orange.withValues(
                                                  alpha: 0.1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20.r),
                                              ),
                                              child: Text(
                                                item.matchedItem.isNotEmpty
                                                    ? "Matched: ${item.matchedItem}"
                                                    : "Category: ${item.matchedCategory}",
                                                style: GoogleFonts.poppins(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.orange,
                                                ),
                                              ),
                                            )
                                          else
                                            Text(
                                              "Nearby Restaurant",
                                              style: GoogleFonts.poppins(
                                                fontSize: 12.sp,
                                                color: Colors.black54,
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }

                      if (state.apiResponse.status == Status.completed &&
                          state.searchModel.results.isEmpty) {
                        return Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.search_off,
                                size: 48,
                                color: Colors.grey,
                              ),
                              SizedBox(height: 12.h),
                              Text(
                                'No Restaurant Found!',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        );
                      }

                      return Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.search_off,
                              size: 48,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 12.h),
                            Text(
                              'No Restaurant Found!',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                color: Colors.black54,
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
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onNavItemTapped,
      ),
    );
  }
}
