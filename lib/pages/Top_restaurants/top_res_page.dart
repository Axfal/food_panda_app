import 'package:excellent_trade_app/pages/home/home_exports.dart';
import 'package:flutter/cupertino.dart';
import '../../../bloc/top_restaurant/top_restaurant_bloc.dart';
import '../../globalWidgets/PrimeryWidgets/my_app_bar.dart';
import '../home/widgets/cards/large_foodCard.dart';

class TopRestaurantsPage extends StatefulWidget {
  const TopRestaurantsPage({super.key});

  @override
  State<TopRestaurantsPage> createState() => _TopRestaurantsPageState();
}

class _TopRestaurantsPageState extends State<TopRestaurantsPage> {
  late String lat;
  late String lng;
  late String radius;

  @override
  void initState() {
    super.initState();

    final locationSession = LocationSessionController();
    lat = locationSession.currentPlace?.lat.toString() ?? "00.00";
    lng = locationSession.currentPlace?.lng.toString() ?? "00.00";
    radius = "5";

    final bloc = context.read<TopRestaurantBloc>();

    if (bloc.state.topRestaurantModel.restaurants == null ||
        bloc.state.topRestaurantModel.restaurants!.isEmpty) {
      bloc.add(FetchTopRestaurantEvent(lng: lng, lat: lat, radius: radius));
    }
  }

  Future<void> _onRefresh() async {
    context.read<TopRestaurantBloc>().add(
      FetchTopRestaurantEvent(lng: lng, lat: lat, radius: radius),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(
        title: 'Top Restaurants',
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<TopRestaurantBloc, TopRestaurantState>(
          builder: (context, state) {
            final response = state.apiResponse;

            if (response.status == Status.loading) {
              return const Center(
                child: CupertinoActivityIndicator(color: Colors.black54),
              );
            }

            if (response.status == Status.error) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      color: Colors.redAccent,
                      size: 48,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      response.message ?? 'Something went wrong',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: _onRefresh,
                      icon: const Icon(Icons.refresh),
                      label: const Text("Retry"),
                    ),
                  ],
                ),
              );
            }

            if (state.topRestaurantModel.restaurants != null &&
                state.topRestaurantModel.restaurants!.isNotEmpty) {
              final restaurants = state.topRestaurantModel.restaurants!;
              return RefreshIndicator(
                onRefresh: _onRefresh,
                backgroundColor: Colors.white,
                color: AppColors.primary,
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: restaurants.length,
                  itemBuilder: (context, index) {
                    final r = restaurants[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      child: LargeFoodCard(
                        onTap: () {},
                        imagePath: 'https://itgenesis.space/Panda_API/API/${r.logo}',
                        title: r.name ?? "Unknown Restaurant",
                        rating: double.tryParse(r.avgRating ?? "0.0") ?? 0.0,
                        reviewsCount: r.totalReviews ?? 0,
                        duration: "${r.distance?.toStringAsFixed(1)} km away",
                        priceLevel: "\$\$",
                        cuisine: r.description ?? "No description",
                        deliveryFee: 0,
                        discountLabel: "Best Choice",
                        isAd: false,
                      ),
                    );
                  },
                ),
              );
            }

            return RefreshIndicator(
              onRefresh: _onRefresh,
              color: Colors.orange,
              child: ListView(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.restaurant_menu,
                            size: 60,
                            color: Colors.grey,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            "No restaurants found near you.",
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
