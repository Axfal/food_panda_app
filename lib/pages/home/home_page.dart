import 'package:excellent_trade_app/bloc/near_by_restaurant/near_by_restaurant_bloc.dart';
import 'package:excellent_trade_app/pages/home/widgets/brand_list.dart';
import '../../Utils/constants/appWeight.dart';
import '../../bloc/top_restaurant/top_restaurant_bloc.dart';
import 'home_exports.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  late String radius;

  @override
  void initState() {
    super.initState();

    final userId = SessionController.user.id.toString();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProfileBloc>().add(FetchProfileEvent(id: userId));
      context.read<CategoryBloc>().add(FetchCategoriesEvent());

      final locationSessionController = LocationSessionController();
      final lat =
          locationSessionController.currentPlace?.lat.toString() ??
          '31.15060600';
      final lng =
          locationSessionController.currentPlace?.lng.toString() ??
          '73.91907590';
      radius = "5";
      context.read<NearByRestaurantBloc>().add(
        FetchNearByRestaurantEvent(lat: lat, lng: lng),
      );

      _selectLocation();

      final bloc = context.read<TopRestaurantBloc>();

      if (bloc.state.topRestaurantModel.restaurants == null ||
          bloc.state.topRestaurantModel.restaurants!.isEmpty) {
        bloc.add(FetchTopRestaurantEvent(lng: lng, lat: lat, radius: radius));
      }
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
      body: CustomScrollView(
        slivers: [
          /// Location Header
          SliverAppBar(
            pinned: false,
            floating: false,
            snap: false,
            expandedHeight: 127.h,
            toolbarHeight: 55.h,
            backgroundColor: AppColors.primary,
            elevation: 0,
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: Column(
                children: [
                  HCustomAppBar(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(8.w),
                      margin: EdgeInsets.only(bottom: 10.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Text(
                        "🍽️ Special Deal: 30% OFF on Top Restaurants!",
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverAppBar(
            pinned: true,
            floating: false,
            snap: false,
            toolbarHeight: 80.h,
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false,
            flexibleSpace: Container(
              decoration: BoxDecoration(color: Colors.white),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24.r),
                    bottomRight: Radius.circular(24.r),
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Hi, Anfal 👋",
                        style: GoogleFonts.poppins(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        "Don’t wait, just mate with food – FoodMate!",
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          /// Search Bar
          // SliverAppBar(
          //   pinned: true,
          //   floating: true,
          //   snap: true,
          //   // total height = your desired bar + status bar height
          //   toolbarHeight: 65.h + MediaQuery.of(context).padding.top,
          //   backgroundColor: AppColors.primary,
          //   shadowColor: Colors.black12,
          //   automaticallyImplyLeading: false,
          //   flexibleSpace: LayoutBuilder(
          //     builder: (context, constraints) {
          //       final topPadding = MediaQuery.of(context).padding.top;
          //       return Padding(
          //         padding: EdgeInsets.fromLTRB(16.w, topPadding, 16.w, 18.h),
          //         child: Align(
          //           alignment: Alignment.bottomCenter,
          //           child: GestureDetector(
          //             onTap: () =>
          //                 Navigator.pushNamed(context, RoutesName.searchScreen),
          //             child: Container(
          //               height: 50.h,
          //               decoration: BoxDecoration(
          //                 color: Colors.white,
          //                 borderRadius: BorderRadius.circular(40.r),
          //                 boxShadow: [
          //                   BoxShadow(
          //                     color: Colors.black12.withOpacity(0.08),
          //                     blurRadius: 8,
          //                     offset: const Offset(0, 3),
          //                   ),
          //                 ],
          //               ),
          //               padding: EdgeInsets.symmetric(horizontal: 14.w),
          //               child: Row(
          //                 children: [
          //                   Icon(
          //                     CupertinoIcons.search,
          //                     size: 20.sp,
          //                     color: Colors.grey[700],
          //                   ),
          //                   SizedBox(width: 10.w),
          //                   Expanded(
          //                     child: Text(
          //                       "Search for restaurants, cuisines...",
          //                       style: GoogleFonts.poppins(
          //                         fontSize: 13.sp,
          //                         color: Colors.grey[600],
          //                       ),
          //                     ),
          //                   ),
          //                   Container(
          //                     decoration: BoxDecoration(
          //                       color: AppColors.primary,
          //                       borderRadius: BorderRadius.circular(50),
          //                     ),
          //                     padding: EdgeInsets.all(6.w),
          //                     child: Icon(
          //                       CupertinoIcons.slider_horizontal_3,
          //                       size: 18.sp,
          //                       color: Colors.white,
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           ),
          //         ),
          //       );
          //     },
          //   ),
          // ),

          /// Promotional Banners
          // SliverAppBar(
          //   pinned: false,
          //   floating: false,
          //   snap: false,
          //   automaticallyImplyLeading: false,
          //   expandedHeight: 125.h,
          //   backgroundColor: AppColors.primary,
          //   elevation: 0,
          //   flexibleSpace: FlexibleSpaceBar(
          //     collapseMode: CollapseMode.pin,
          //     background: Padding(
          //       padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          //       child: PromotionalBannerWithGrid(),
          //     ),
          //   ),
          // ),

          /// 🏷 Content Section
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 8.w),
              decoration: const BoxDecoration(
                color: AppColors.white,
                // borderRadius: BorderRadius.only(
                //   topRight: Radius.circular(24),
                //   topLeft: Radius.circular(24),
                // ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CategoryList(
                    title: "",
                    labels: [
                      {'label': 'Offers'},
                      {'label': 'Top Restaurants'},
                      {'label': 'New'},
                      {'label': 'Pick-up'},
                      {'label': 'Home Chef'},
                    ],
                    images: [
                      'assets/logos/offers.png',
                      'assets/logos/super_restaurants.png',
                      'assets/logos/new_restaurant.png',
                      'assets/logos/pick_up.png',
                      'assets/logos/home_chef.png',
                    ],
                    onTaps: [
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => OffersPage()),
                      ),
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TopRestaurantsPage(),
                        ),
                      ),
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewRestaurantsPage(),
                        ),
                      ),
                      () {},
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CampaignPage(
                            campaignImage: 'assets/images/homechef_bg.jpg',
                            sheetTitle: 'Homechef Deals & Discounts',
                            sheetSubtitle: 'Ghar jesa khana!',
                            cardsData: foodCards,
                          ),
                        ),
                      ),
                    ],
                  ),

                  Divider(thickness: 1.2, color: AppColors.border),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 8,
                    ),
                    child: Text(
                      "Categories",
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontWeight: AppWeights.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  CategoriesInputWidget(),
                  SizedBox(height: 8.h),
                  Divider(thickness: 1.2, color: AppColors.border),
                  SizedBox(height: 8.h),
                  ExploreWidget(),
                  SizedBox(height: 24.h),
                  BrandList(title: 'Top Brands'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
