import 'package:excellent_trade_app/config/routes/route_export.dart';
import 'package:excellent_trade_app/pages/auth/forgot_password/forget_password_export.dart';
import 'package:excellent_trade_app/pages/grocery/grocery_page.dart';
import 'package:excellent_trade_app/pages/profile/account_page.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    GroceryPage(),
    SearchPage(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[_currentIndex],

      // Bottom Navigation Bar
      bottomNavigationBar: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.3),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            child: SalomonBottomBar(
              currentIndex: _currentIndex,
              onTap: (i) => setState(() => _currentIndex = i),
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white70,
              items: [
                SalomonBottomBarItem(
                  icon: const Icon(Icons.home, size: 24),
                  title: const Text("Home"),
                  selectedColor: Colors.white,
                ),
                SalomonBottomBarItem(
                  icon: const Icon(Icons.store_mall_directory, size: 24),
                  title: const Text("Grocery"),
                  selectedColor: Colors.white,
                ),
                SalomonBottomBarItem(
                  icon: const Icon(Icons.search_rounded, size: 24),
                  title: const Text("Search"),
                  selectedColor: Colors.white,
                ),
                SalomonBottomBarItem(
                  icon: const Icon(Icons.person, size: 24),
                  title: const Text("Person"),
                  selectedColor: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
