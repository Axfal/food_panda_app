import 'package:excellent_trade_app/pages/grocery/grocery_page.dart';
import 'package:excellent_trade_app/pages/profile/account_page.dart';
import 'package:flutter/material.dart';
import '../../../../Utils/constants/app_colors.dart';
import '../../pages/home/home_page.dart';
import '../../pages/search/search_page.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    void _navigate(BuildContext context, Widget page) {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => page,
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: const Duration(milliseconds: 250),
        ),
      );
    }

    return BottomNavigationBar(
      backgroundColor: AppColors.white,
      currentIndex: currentIndex,
      onTap: (index) {
        if (index == currentIndex) return;

        switch (index) {
          case 0:
            _navigate(context, const HomePage());
            break;
          case 1:
            _navigate(context, const GroceryPage());
            break;
          case 2:
            _navigate(context, const SearchPage());
            break;
          case 3:
            _navigate(context, const AccountPage());
            break;
        }
      },
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.textSecondary,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.restaurant), label: 'Food'),
        BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Grocery'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
      ],
    );
  }
}
