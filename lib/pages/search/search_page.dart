import 'package:excellent_trade_app/Utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
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

  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Modern Search Bar
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
                  child: TextField(
                    style: GoogleFonts.poppins(fontSize: 14.sp),
                    decoration: InputDecoration(
                      icon: const Icon(Icons.search, color: Colors.black54),
                      hintText: 'Search for restaurants and groceries',
                      hintStyle: GoogleFonts.poppins(
                        color: Colors.black45,
                        fontSize: 14.sp,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),

                SizedBox(height: 24.h),

                // Recent Searches
                if (recentSearches.isNotEmpty) ...[
                  Text(
                    'Recent Searches',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Column(
                    children: recentSearches.map((item) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 6.h),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.history,
                              size: 20,
                              color: Colors.black45,
                            ),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: Text(
                                item,
                                style: GoogleFonts.poppins(
                                  fontSize: 13.sp,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.close,
                                size: 18,
                                color: Colors.black45,
                              ),
                              onPressed: () {
                                // Handle remove logic
                              },
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 20.h),
                ],

                // Popular Searches
                Text(
                  'Popular in Restaurants',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 12.h),
                Wrap(
                  spacing: 8.w,
                  runSpacing: 8.h,
                  children: popularSearches.map((search) {
                    return Chip(
                      label: Text(
                        search,
                        style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          color: Colors.black87,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 4.h,
                      ),
                      backgroundColor: Colors.grey.shade100,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.r),
                      ),
                      elevation: 1,
                    );
                  }).toList(),
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

// Dummy recent searches
final List<String> recentSearches = [
  'Ice Cream',
  'Haji Pervaiz Chana Weley',
  'Shawarma near me',
  'Mellowcheez',
  'Falooda',
];

// Dummy popular searches
final List<String> popularSearches = [
  'KFC',
  'McDonalds',
  'Burger King',
  'Pizza',
  'Dominos',
  'Burger',
  'Zinger deals 🍔',
];
