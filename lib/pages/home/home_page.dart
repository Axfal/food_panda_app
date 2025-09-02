import 'package:excellent_trade_app/bloc/account/profile/profile_bloc.dart';
import 'package:excellent_trade_app/bloc/auth/auth_exports.dart';
import 'package:excellent_trade_app/bloc/category/category_bloc.dart';
import 'package:excellent_trade_app/pages/Top_restaurants/top_res_page.dart';
import 'package:excellent_trade_app/pages/auth/forgot_password/forget_password_export.dart';
import 'package:excellent_trade_app/pages/home/widgets/categories_input_widget.dart';
import 'package:excellent_trade_app/pages/home/widgets/discountCardList/discount_data.dart';
import 'package:excellent_trade_app/pages/new_restaurants/new_restaurants_page.dart';
import 'package:excellent_trade_app/pages/offers/offers_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../globalWidgets/PrimeryWidgets/customeBottonNavBar.dart';
import '../../service/location/location_storage.dart';
import '../Campaign/Campain_page.dart';
import '../location/location.dart';
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
  @override
  void initState() {
    super.initState();

    final userId = SessionController.user.id.toString();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProfileBloc>().add(FetchProfileEvent(id: userId));
      context.read<CategoryBloc>().add(FetchCategoriesEvent());

      _selectLocation();
    });
  }

  void _selectLocation() async {
    final locationSession = LocationSessionController();

    if (!locationSession.hasLocation) {
      Timer(const Duration(seconds: 1), () {
        Navigator.of(context).push(_createRoute());
      });
    }
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const LocationScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }

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
          height: MediaQuery.of(context).size.height * 2.15,
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
                        images: [
                          'assets/icons/offers.png',
                          'assets/icons/super_restaurant.png',
                          'assets/icons/new_restaurant.png',
                          'assets/icons/pick_up.png',
                          'assets/icons/home_chef.png',
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
                                  NewRestaurantsPage(),
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
                      CategoriesInputWidget(),
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
                      // BrandList(
                      //   labels: [
                      //     {'label': 'Burger Lab'},
                      //     {'label': 'California Pizza'},
                      //     {'label': 'KFC'},
                      //     {'label': 'Broadway Pizza'},
                      //     {'label': 'OPTP'},
                      //     {'label': 'Pizza Max'},
                      //     {'label': 'McDonald\'s'},
                      //     {'label': 'Hardee\'s'},
                      //   ],
                      //   onTaps: [
                      //     () {},
                      //     () {},
                      //     () {},
                      //     () {},
                      //     () {},
                      //     () {},
                      //     () {},
                      //     () {},
                      //   ],
                      // ),
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
          HCustomAppBar(),

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
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          RoutesName.searchScreen
                        );
                      },
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
