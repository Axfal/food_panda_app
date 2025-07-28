import 'package:excellent_trade_app/pages/home/widgets/discountCardList/discount_data.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightPink,
      // appBar: AppBar(
      //   title: Text("Test screens"),
      //   backgroundColor: Colors.blue,
      //   actions: [
      //     PopupMenuButton<String>(
      //       icon: const Icon(Icons.more_vert, color: Colors.black),
      //       onSelected: (value) {
      //         if (value == 'Screen 01') {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => Screen01()),
      //           );
      //         } else if (value == 'Screen 02') {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => Screen02()),
      //           );
      //         } else if (value == 'Screen 03') {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => Screen03()),
      //           );
      //         }
      //        else if (value == 'Screen 04') {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => ApplyVoucher()),
      //           );
      //         }
      //       },
      //       itemBuilder: (BuildContext context) => [
      //         PopupMenuItem(
      //           value: 'Screen 01',
      //           child: Text('Screen 01', style: GoogleFonts.poppins()),
      //         ),
      //         PopupMenuItem(
      //           value: 'Screen 02',
      //           child: Text('Screen 02', style: GoogleFonts.poppins()),
      //         ),
      //         PopupMenuItem(
      //           value: 'Screen 03',
      //           child: Text('Screen 03', style: GoogleFonts.poppins()),
      //         ),
      //        PopupMenuItem(
      //           value: 'Screen 04',
      //           child: Text('Screen 04', style: GoogleFonts.poppins()),
      //         ),
      //       ],
      //     ),
      //   ],
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header Section
            headerSection(),

            /// Body Section
            Transform.translate(
              offset: Offset(0, -35.h),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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

                    SizedBox(height: 12.h),
                    CardList(title: 'Home Chef', cardsData: foodCards),
                    SizedBox(height: 16.h),
                    DiscountDealList(),
                    SizedBox(height: 16.h),
                    MealDealList(),
                    SizedBox(height: 16.h),
                    BrandList(),
                    SizedBox(height: 16.h),
                    CardList(title: 'Try Something New', cardsData: foodCards),
                    SizedBox(height: 16.h),
                    ExploreWidget(cardsData: foodCards),
                    SizedBox(height: 20.h),
                  ],
                ),
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

  Widget headerSection() {
    return Container(
      height: 340.h, // fixed height to allow overlap
      width: double.infinity,
      decoration: BoxDecoration(color: AppColors.primary),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          h_CustomeAppBar(),

          /// Search Bar
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            child: Container(
              height: 44.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Row(
                children: [
                  Icon(
                    CupertinoIcons.search,
                    size: 20.sp,
                    color: Colors.grey[800],
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: TextField(
                      cursorColor: AppColors.primary,
                      style: GoogleFonts.poppins(
                        fontSize: 13.sp,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        hintText: "Search for restaurants",
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 13.sp,
                          color: Colors.grey,
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

          /// Promo Banner + Grid
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: PromotionalBannerWithGrid(),
          ),
        ],
      ),
    );
  }
}
