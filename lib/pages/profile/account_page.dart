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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          toolbarHeight: 50,
          titleSpacing: 0,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Text(
                  "Accounts",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: AppWeights.semiBold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => SettingsPage()),
                  ),
                  child: const Icon(Icons.settings_outlined, size: 20),
                ),
              ],
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: Container(
              color: AppColors.textSecondary.withOpacity(0.25),
              height: 1,
            ),
          ),
        ),

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
                      "Your Name",
                      style: GoogleFonts.montserrat(
                        fontWeight: AppWeights.extraBold,
                        fontSize: 20,
                      ),
                    ),
                    GestureDetector(
                      child: const Text(
                        "View Profile",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: AppWeights.extraBold,
                        ),
                      ),
                      onTap: () {},
                    ),
                    const SizedBox(height: 25),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF5C1C94),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 230,
                                child: Text(
                                  "Save With pandapro! Free for 14 days",
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontWeight: AppWeights.extraBold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: const [
                                  Text(
                                    "Start your free trial",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.white,
                                    ),
                                  ),
                                  SizedBox(width: 4),
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Icon(
                                        Icons.circle,
                                        color: AppColors.white,
                                        size: 16,
                                      ),
                                      Icon(
                                        CupertinoIcons.chevron_right,
                                        size: 12,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Spacer(),
                          Image.asset(
                            "assets/images/pandapro.png",
                            height: 80,
                            width: 80,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
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
                              MaterialPageRoute(
                                builder: (_) => FavouritesPage(),
                              ),
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
                              MaterialPageRoute(
                                builder: (_) => AddressesPage(),
                              ),
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
                          color: AppColors.textSecondary.withOpacity(0.55),
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
        border: Border.all(color: AppColors.textSecondary.withOpacity(0.25)),
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
              color: AppColors.textSecondary.withOpacity(0.25),
            ),
          ],
        );
      }).toList(),
    ],
  );
}
