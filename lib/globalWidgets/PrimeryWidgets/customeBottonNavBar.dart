// import 'package:excellent_trade_app/pages/grocery/grocery_page.dart';
// import 'package:excellent_trade_app/pages/profile/account_page.dart';
// import 'package:flutter/material.dart';
// import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
// import '../../pages/home/home_page.dart';
// import '../../pages/search/search_page.dart';
// import '../../../../Utils/constants/app_colors.dart';
//
// class CustomBottomNavBar extends StatefulWidget {
//   const CustomBottomNavBar({super.key});
//
//   @override
//   State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
// }
//
// class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
//   int _currentIndex = 0;
//
//   final List<Widget> _pages = const [
//     HomePage(),
//     GroceryPage(),
//     SearchPage(),
//     AccountPage(),
//   ];
//
//   void _navigate(int index) {
//     setState(() => _currentIndex = index);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _pages[_currentIndex],
//
//       // Better Styled Bottom Bar
//       bottomNavigationBar: SafeArea(
//         child: Container(
//           margin: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
//           decoration: BoxDecoration(
//             color: AppColors.primary, // your app theme color
//             borderRadius: BorderRadius.circular(18),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withValues(alpha: 0.2),
//                 blurRadius: 8,
//                 offset: const Offset(0, 4),
//               ),
//             ],
//           ),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
//             child: SalomonBottomBar(
//               currentIndex: _currentIndex,
//               onTap: _navigate,
//               selectedItemColor: Colors.white,
//               unselectedItemColor: Colors.white70,
//               items: [
//                 SalomonBottomBarItem(
//                   icon: const Icon(Icons.restaurant, size: 24),
//                   title: const Text("Food"),
//                   selectedColor: Colors.white,
//                 ),
//                 SalomonBottomBarItem(
//                   icon: const Icon(Icons.store, size: 24),
//                   title: const Text("Grocery"),
//                   selectedColor: Colors.white,
//                 ),
//                 SalomonBottomBarItem(
//                   icon: const Icon(Icons.search, size: 24),
//                   title: const Text("Search"),
//                   selectedColor: Colors.white,
//                 ),
//                 SalomonBottomBarItem(
//                   icon: const Icon(Icons.person, size: 24),
//                   title: const Text("Account"),
//                   selectedColor: Colors.white,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
