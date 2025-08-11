import 'package:excellent_trade_app/pages/Top_restaurants/top_res_page.dart';
import 'package:excellent_trade_app/pages/home/widgets/discountCardList/discount_data.dart';
import 'package:excellent_trade_app/pages/new_restaurants/new_restaurants_page.dart';
import 'package:excellent_trade_app/pages/offers/offers_page.dart';
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
import 'widgets/app_bar.dart';
import 'widgets/cardList/card_list.dart';
import 'widgets/promotional_banner_grid.dart';
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
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              /// Header Section
              headerSection(),
              /// Body Section
              Positioned(
                top: 315.h,
                left: 0,
                right: 0,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    // horizontal: 12.w,
                    vertical: 16.h,
                  ),
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
                      BrandList(
                        title: "",
                        labels: [
                          {'label': 'offers'},
                          {'label': 'Top Restaurants'},
                          {'label': 'New Restaurants'},
                          {'label': 'Pick-up'},
                          {'label': 'Home Chef'},
                        ],
                        onTaps: [
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OffersPage(),
                            ),
                          ),
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  TopRestaurantsPage(cardsData: foodCards),
                            ),
                          ),
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  NewRestaurantsPage(cardsData: foodCards),
                            ),
                          ),
                          () {},
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CampaignPage(
                                campaignImage: 'assets/images/homechef_bg.jpg',
                                sheetTitle: 'Homechef Deals and Discounts',
                                sheetSubtitle: 'Ghar jesa khana!',
                                cardsData: foodCards,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(thickness: 1.5, color: AppColors.border),
                      SizedBox(height: 18.h),
                      BrandList(
                        title: "",
                        labels: [
                          {'label': 'Burger Lab'},
                          {'label': 'California Pizza'},
                          {'label': 'KFC'},
                          {'label': 'Broadway Pizza'},
                          {'label': 'OPTP'},
                          {'label': 'Pizza Max'},
                          {'label': 'McDonald\'s'},
                          {'label': 'Hardee\'s'},
                        ],
                        onTaps: [
                          () {},
                          () {},
                          () {},
                          () {},
                          () {},
                          () {},
                          () {},
                          () {},
                        ],
                      ),
                      // HorizontalCategoryList(),
                      DiscountCardList(
                        cards: discountCards,
                        onTapCard: (card) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => CampaignPage(
                                campaignImage: card['campaignImage'] ?? '',
                                sheetTitle:
                                    card['sheetTitle'] ?? 'Special Offer',
                                sheetSubtitle:
                                    card['sheetSubtitle'] ??
                                    'Enjoy exciting deals!',
                                cardsData: List<Map<String, dynamic>>.from(
                                  card['cardsData'] ?? [],
                                ),
                              ),
                            ),
                          );
                        },
                      ),

                      SizedBox(height: 16.h),
                      BrandList(
                        labels: [
                          {'label': 'Burger Lab'},
                          {'label': 'California Pizza'},
                          {'label': 'KFC'},
                          {'label': 'Broadway Pizza'},
                          {'label': 'OPTP'},
                          {'label': 'Pizza Max'},
                          {'label': 'McDonald\'s'},
                          {'label': 'Hardee\'s'},
                        ],
                        onTaps: [
                          () {},
                          () {},
                          () {},
                          () {},
                          () {},
                          () {},
                          () {},
                          () {},
                        ],
                      ),
                      CardList(
                        title: 'Try Something New',
                        cardsData: foodCards,
                      ),
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
      ),

      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onNavItemTapped,
      ),
    );
  }

  Widget headerSection() {
    return Container(
      height: 340.h,
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
