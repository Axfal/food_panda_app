import 'package:excellent_trade_app/config/routes/routes.dart';
import 'package:excellent_trade_app/pages/home/widgets/discountCardList/discount_data.dart';
import 'package:excellent_trade_app/pages/screen_01.dart';
import 'package:excellent_trade_app/pages/screen_02.dart';
import 'package:excellent_trade_app/pages/screen_03.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Utils/constants/app_colors.dart';
import '../../globalWidgets/PrimeryWidgets/customeBottonNavBar.dart';
import '../Campaign/Campain_page.dart';
import 'widgets/Explore/explore_Widget.dart';
import 'widgets/brand_list.dart';
import '../data/card_data.dart';
import 'widgets/promoLists/Discount_on_discountList.dart';
import 'widgets/promoLists/MealDealList.dart';
import 'widgets/app_bar.dart';
import 'widgets/cardList/card_list.dart';
import 'widgets/promotional_banner_grid.dart';
import 'widgets/icon_list.dart';
import 'widgets/category_list.dart';
import 'widgets/discountCardList/discount_card_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Handle navigation logic here if needed
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.lightPink,
        appBar: AppBar(
          title: Text("Test screens"),
          backgroundColor: Colors.blue,
          actions: [
            PopupMenuButton<String>(
              icon: const Icon(Icons.more_vert, color: Colors.black),
              onSelected: (value) {
                if (value == 'Screen 01') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Screen01()),
                  );
                } else if (value == 'Screen 02') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Screen02()),
                  );
                } else if (value == 'Screen 03') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Screen03()),
                  );
                }
              },
              itemBuilder: (BuildContext context) => [
                PopupMenuItem(
                  value: 'Screen 01',
                  child: Text('Screen 01', style: GoogleFonts.poppins()),
                ),
                PopupMenuItem(
                  value: 'Screen 02',
                  child: Text('Screen 02', style: GoogleFonts.poppins()),
                ),
                PopupMenuItem(
                  value: 'Screen 03',
                  child: Text('Screen 03', style: GoogleFonts.poppins()),
                ),
              ],
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    h_CustomeAppBar(),

                    /// Search Bar
                    Container(
                      height: 56.h,
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 40.h,
                              padding: EdgeInsets.symmetric(horizontal: 8.w),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.r),
                                border: Border.all(color: Colors.white),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    CupertinoIcons.search,
                                    size: 20.sp,
                                    color: Colors.black,
                                  ),
                                  SizedBox(width: 6.w),
                                  Expanded(
                                    child: TextField(
                                      cursorColor: AppColors.primary,
                                      style: TextStyle(fontSize: 12.sp),
                                      decoration: InputDecoration(
                                        hintText: "Search for restaurants",
                                        hintStyle: TextStyle(
                                          color: AppColors.textSecondary,
                                          fontSize: 14.sp,
                                        ),
                                        border: InputBorder.none,
                                        isCollapsed: true,
                                        contentPadding: EdgeInsets.zero,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    PromotionalBannerWithGrid(),
                  ],
                ),
              ),

              /// White Background Section
              Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16),
                    topLeft: Radius.circular(16),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 16.h),
                    HorizontalIconList(),
                    Divider(thickness: 1, color: AppColors.border),
                    HorizontalCategoryList(),
                    DiscountCardList(
                      cards: discountCards,
                      onTapCard: (card) {
                        final data = card['DiscountData'];
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => CampaignPage(
                              campaignImage: data['campaignImage'],
                              sheetTitle: data['sheetTitle'],
                              sheetSubtitle: data['sheetSubtitle'],
                              cardsData: List<Map<String, dynamic>>.from(
                                data['cardsData'],
                              ),
                            ),
                          ),
                        );
                      },
                    ),

                    CardList(title: 'Home Chef', cardsData: foodCards),
                    SizedBox(height: 16.h),
                    DiscountDealList(),
                    SizedBox(height: 16.h),
                    MealDealList(),
                    SizedBox(height: 16.h),
                    BrandList(),
                    CardList(title: 'Try Something New', cardsData: foodCards),
                    SizedBox(height: 16.h),

                    ExploreWidget(cardsData: foodCards),
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
