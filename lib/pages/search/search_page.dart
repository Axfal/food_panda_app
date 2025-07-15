import 'package:excellent_trade_app/Utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../globalWidgets/PrimeryWidgets/customeBottonNavBar.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 2;

    void _onNavItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
      // Handle navigation logic here if needed
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20.r),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: TextField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.search, color: Colors.grey),
                    hintText: 'Search for restaurants and groceries',
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Recent Searches
              if (recentSearches.isNotEmpty) ...[
                const Text(
                  'Recent searches',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                Column(
                  children: recentSearches.map((item) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.history,
                            size: 18,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 8),
                          Expanded(child: Text(item)),
                          IconButton(
                            icon: const Icon(Icons.close, size: 18),
                            onPressed: () {
                              // Handle remove recent search
                            },
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20),
              ],

              // Popular Searches
              const Text(
                'Popular searches in Restaurants',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: popularSearches.map((search) {
                  return Chip(
                    label: Text(search),
                    backgroundColor: Colors.grey[200],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
        bottomNavigationBar: CustomBottomNavBar(
          currentIndex: _selectedIndex,
          onTap: _onNavItemTapped,
        ),
      ),
    );
  }
}

final List<String> recentSearches = [
  'ice cream',
  'haji pervaiz chana weley',
  'shawarma near me',
  'mellowcheez',
  'Fhaluda',
];

final List<String> popularSearches = [
  'kfc',
  'mcdonalds',
  'burger king',
  'pizza',
  'dominos',
  'burger',
  'burger 🍔 deals zinger buy 1 get freewings',
];
