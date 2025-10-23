import 'package:excellent_trade_app/bloc/near_by_restaurant/near_by_restaurant_bloc.dart';
import 'package:excellent_trade_app/pages/home/widgets/brand_list.dart';
import '../../Utils/constants/appWeight.dart';
import '../../bloc/banner/banner_bloc.dart';
import '../../bloc/top_restaurant/top_restaurant_bloc.dart';
import '../../bloc/wish_list/wish_list_bloc.dart';
import 'home_exports.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String radius;

  @override
  void initState() {
    super.initState();

    final userId = SessionController.user.id.toString();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProfileBloc>().add(FetchProfileEvent(id: userId));
      context.read<CategoryBloc>().add(FetchCategoriesEvent());
      context.read<BannerBloc>().add(FetchBannerEvent());
      context.read<WishListBloc>().add(FetchWishListEvent(userId: userId));

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

      // _selectLocation();

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

  @override
  Widget build(BuildContext context) {
    // final userName = SessionController.user.name;
    return Scaffold(
      backgroundColor: AppColors.lightPink,
      body: RefreshIndicator(
        color: Colors.white,
        backgroundColor: AppColors.primary,
        onRefresh: () async {
          final userId = SessionController.user.id.toString();

          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.read<ProfileBloc>().add(FetchProfileEvent(id: userId));
            context.read<CategoryBloc>().add(FetchCategoriesEvent());
            context.read<BannerBloc>().add(FetchBannerEvent());
            context.read<WishListBloc>().add(
              FetchWishListEvent(userId: userId),
            );

            final locationSessionController = LocationSessionController();
            final lat =
                locationSessionController.currentPlace?.lat.toString() ?? '0.0';
            final lng =
                locationSessionController.currentPlace?.lng.toString() ?? '0.0';
            radius = "5";
            context.read<NearByRestaurantBloc>().add(
              FetchNearByRestaurantEvent(lat: lat, lng: lng),
            );

            // _selectLocation();

            final bloc = context.read<TopRestaurantBloc>();

            if (bloc.state.topRestaurantModel.restaurants == null ||
                bloc.state.topRestaurantModel.restaurants!.isEmpty) {
              bloc.add(
                FetchTopRestaurantEvent(lng: lng, lat: lat, radius: radius),
              );
            }
          });
        },
        child: CustomScrollView(
          slivers: [
            /// Location Header
            SliverAppBar(
              pinned: true,
              floating: false,
              snap: false,
              expandedHeight: 65.h,
              toolbarHeight: 55.h,
              backgroundColor: AppColors.primary,
              elevation: 0,
              automaticallyImplyLeading: false,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: HCustomAppBar(),
              ),
            ),
            // SliverAppBar(
            //   pinned: true,
            //   floating: false,
            //   snap: false,
            //   toolbarHeight: 80.h,
            //   backgroundColor: Colors.transparent,
            //   elevation: 0,
            //   automaticallyImplyLeading: false,
            //   flexibleSpace: Container(
            //     decoration: BoxDecoration(color: Colors.white),
            //     child: Container(
            //       decoration: BoxDecoration(
            //         color: AppColors.primary,
            //         borderRadius: BorderRadius.only(
            //           bottomLeft: Radius.circular(24.r),
            //           bottomRight: Radius.circular(24.r),
            //         ),
            //       ),
            //       padding: EdgeInsets.symmetric(
            //         horizontal: 16.w,
            //         vertical: 12.h,
            //       ),
            //       child: SafeArea(
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: [
            //             Text(
            //               "Hi, $userName 👋",
            //               style: GoogleFonts.poppins(
            //                 fontSize: 24.sp,
            //                 fontWeight: FontWeight.w700,
            //                 color: Colors.white,
            //               ),
            //             ),
            //             SizedBox(height: 4.h),
            //             Text(
            //               "Don’t wait, just mate with food – FoodMate!",
            //               style: GoogleFonts.poppins(
            //                 fontSize: 14.sp,
            //                 fontWeight: FontWeight.w500,
            //                 color: Colors.white.withValues(alpha: 0.9),
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
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

            /// Enhanced White Background Banner Section
            SliverToBoxAdapter(
              child: Container(
                width: double.infinity,
                color: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 14.h),
                child: BlocBuilder<BannerBloc, BannerState>(
                  builder: (context, state) {
                    if (state.apiResponse.status == Status.loading) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: Container(
                            height: 160.h,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                          ),
                        ),
                      );
                    }

                    if (state.apiResponse.status == Status.error) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 10.h,
                        ),
                        child: Container(
                          height: 160.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.08),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Text(
                            'Failed to load banners',
                            style: GoogleFonts.poppins(
                              color: Colors.redAccent,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      );
                    }

                    final banners = state.bannerModel.banners ?? [];
                    if (banners.isEmpty) return const SizedBox.shrink();

                    final pageController = PageController(
                      viewportFraction: 0.88,
                    );
                    final ValueNotifier<int> currentPage = ValueNotifier(0);

                    Future.microtask(() async {
                      while (true) {
                        await Future.delayed(const Duration(seconds: 4));
                        if (pageController.hasClients && banners.isNotEmpty) {
                          int nextPage =
                              (currentPage.value + 1) % banners.length;
                          pageController.animateToPage(
                            nextPage,
                            duration: const Duration(milliseconds: 700),
                            curve: Curves.easeInOut,
                          );
                          currentPage.value = nextPage;
                        }
                      }
                    });

                    return Column(
                      children: [
                        SizedBox(
                          height: 200.h,
                          child: PageView.builder(
                            controller: pageController,
                            itemCount: banners.length,
                            onPageChanged: (index) => currentPage.value = index,
                            itemBuilder: (context, index) {
                              final banner = banners[index];
                              return AnimatedBuilder(
                                animation: pageController,
                                builder: (context, child) {
                                  double scale = 1.0;
                                  if (pageController.position.haveDimensions) {
                                    scale = (pageController.page! - index)
                                        .abs()
                                        .clamp(0, 1);
                                    scale = 1 - (scale * 0.1);
                                  }
                                  return Transform.scale(
                                    scale: scale,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 0.w,
                                        vertical: 6.h,
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                            20.r,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withValues(
                                                alpha: 0.08,
                                              ),
                                              blurRadius: 10,
                                              offset: const Offset(0, 4),
                                            ),
                                          ],
                                        ),
                                        clipBehavior: Clip.hardEdge,
                                        child: Stack(
                                          fit: StackFit.expand,
                                          children: [
                                            Image.network(
                                              banner.imageUrl ?? '',
                                              fit: BoxFit.cover,
                                              errorBuilder:
                                                  (
                                                    context,
                                                    error,
                                                    stackTrace,
                                                  ) => Container(
                                                    color: Colors.grey.shade200,
                                                    alignment: Alignment.center,
                                                    child: const Icon(
                                                      Icons
                                                          .broken_image_rounded,
                                                      color: Colors.grey,
                                                      size: 50,
                                                    ),
                                                  ),
                                            ),

                                            Container(
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  begin: Alignment.bottomCenter,
                                                  end: Alignment.topCenter,
                                                  colors: [
                                                    Colors.black.withValues(
                                                      alpha: 0.55,
                                                    ),
                                                    Colors.transparent,
                                                  ],
                                                ),
                                              ),
                                            ),

                                            if (banner.title != null &&
                                                banner.title!.isNotEmpty)
                                              Positioned(
                                                left: 14.w,
                                                bottom: 14.h,
                                                right: 14.w,
                                                child: Text(
                                                  banner.title!,
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GoogleFonts.poppins(
                                                    color: Colors.white,
                                                    fontSize: 17.sp,
                                                    fontWeight: FontWeight.w600,
                                                    shadows: const [
                                                      Shadow(
                                                        offset: Offset(0, 1),
                                                        blurRadius: 2,
                                                        color: Colors.black45,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),

                        ValueListenableBuilder<int>(
                          valueListenable: currentPage,
                          builder: (context, value, _) {
                            return Padding(
                              padding: EdgeInsets.only(top: 8.h),
                              child: SmoothPageIndicator(
                                controller: pageController,
                                count: banners.length,
                                effect: ExpandingDotsEffect(
                                  dotHeight: 7.h,
                                  dotWidth: 7.h,
                                  activeDotColor: AppColors.primary,
                                  dotColor: Colors.grey.shade400,
                                  expansionFactor: 5,
                                  spacing: 5.w,
                                  radius: 10,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),

            /// 🏷 Content Section
            SliverToBoxAdapter(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 20.h),
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
      ),
    );
  }
}
