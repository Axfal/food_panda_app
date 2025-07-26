import 'package:excellent_trade_app/Utils/constants/appWeight.dart';
import 'package:excellent_trade_app/Utils/constants/app_colors.dart';
import 'package:excellent_trade_app/globalWidgets/PrimeryWidgets/customeButtons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../globalWidgets/PrimeryWidgets/customeBottonNavBar.dart';
import 'subPages/addresses_page.dart';
import 'subPages/fav_page.dart';
import 'subPages/order_page.dart';
import 'subPages/settings.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  int _selectedIndex = 3;

  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildModernAppBar(context),

      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5),
                  Text(
                    "Muhammad Anfal",
                    style: GoogleFonts.montserrat(
                      fontWeight: AppWeights.extraBold,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  GestureDetector(
                    child: const Text(
                      "anfalshah72@gmail.com",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: AppWeights.extraBold,
                        color: Colors.black,
                      ),
                    ),
                    onTap: () {},
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Container(
                      height: 100,
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Center(
                        child: Text(
                          'Ads',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: buildIconCard(
                          imagePath: 'assets/images/icons/order.png',
                          label: 'Order',
                          onTap: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => PastOrdersPage(),
                              ),
                            ),
                          },
                        ),
                      ),
                      const SizedBox(width: 18),
                      Expanded(
                        child: buildIconCard(
                          icon: LucideIcons.heart,
                          label: 'Favourites',
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => FavouritesPage()),
                          ),
                        ),
                      ),
                      const SizedBox(width: 18),
                      Expanded(
                        child: buildIconCard(
                          icon: LucideIcons.mapPin,
                          label: 'Addresses',
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => AddressesPage()),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: AppColors.textSecondary.withValues(alpha: 0.55),
                        width: 0.5,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const [
                          Image(
                            image: AssetImage(
                              "assets/images/icons/pandaPay.png",
                            ),
                            height: 20,
                          ),
                          SizedBox(width: 4),
                          Text("Pandapay Credit"),
                          Spacer(),
                          Text("Rs 0.00"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: AppColors.white,
              child: Column(
                children: [
                  buildSectionList(
                    heading: "Perks for you",
                    items: [
                      {
                        'icon': LucideIcons.crown,
                        'label': 'Become a pro',
                        'onTap': () => debugPrint('Become a pro tapped'),
                      },
                      {
                        'icon': LucideIcons.trophy,
                        'label': 'panda rewards',
                        'onTap': () => debugPrint('panda rewards tapped'),
                      },
                      {
                        'icon': LucideIcons.ticket,
                        'label': 'Vouchers',
                        'onTap': () => debugPrint('Vouchers tapped'),
                      },
                      {
                        'icon': LucideIcons.gift,
                        'label': 'Invite friends',
                        'onTap': () => debugPrint('Invite friends tapped'),
                      },
                    ],
                  ),
                  buildSectionList(
                    heading: "General",
                    items: [
                      {
                        'icon': CupertinoIcons.question_circle,
                        'label': 'Help center',
                        'onTap': () => debugPrint('Help center tapped'),
                      },
                      {
                        'icon': LucideIcons.building2,
                        'label': 'foodpanda for business',
                        'onTap': () => debugPrint('business tapped'),
                      },
                      {
                        'icon': LucideIcons.file,
                        'label': 'Terms&policies',
                        'onTap': () => debugPrint('terms tapped'),
                      },
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomButton(
                          text: "Log Out",
                          bgcolor: AppColors.white,
                          onTap: () => const {},
                          color: AppColors.black,
                          border: true,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onNavItemTapped,
      ),
    );
  }

  AppBar buildModernAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      toolbarHeight: 60,
      titleSpacing: 16,
      title: Text(
        'Account',
        style: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
      actions: [
        IconButton(
          splashRadius: 24,
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => SettingsPage()),
          ),
          icon: Icon(Icons.settings_outlined, size: 24, color: Colors.black87),
        ),
        const SizedBox(width: 12),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(
          color: AppColors.textSecondary.withValues(alpha: 0.2),
          height: 1,
        ),
      ),
    );
  }
}

Widget buildIconCard({
  String? imagePath,
  IconData? icon,
  required String label,
  required VoidCallback onTap,
}) {
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(8),
    child: Container(
      padding: const EdgeInsets.fromLTRB(12, 20, 12, 8),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.textSecondary.withValues(alpha: 0.25),
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 2, offset: Offset(0, 1)),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (imagePath != null)
            Image.asset(imagePath, height: 24, width: 24)
          else if (icon != null)
            Icon(icon, size: 24, color: Colors.black),
          const SizedBox(height: 10),
          Text(
            label,
            style: const TextStyle(fontSize: 10),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );
}

Widget buildSectionList({
  required String heading,
  required List<Map<String, dynamic>> items,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
        child: Text(
          heading,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      SizedBox(height: 8),
      ...items.map((item) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(item['icon'], size: 20),
                title: Text(
                  item['label'],
                  style: const TextStyle(fontSize: 14),
                ),
                trailing: const Icon(Icons.arrow_forward_ios, size: 15),
                dense: true,
                onTap: item['onTap'] ?? () {},
              ),
            ),
            Divider(
              height: 1,
              color: AppColors.textSecondary.withValues(alpha: 0.25),
            ),
          ],
        );
      }).toList(),
    ],
  );
}
