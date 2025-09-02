import 'package:excellent_trade_app/globalWidgets/PrimeryWidgets/my_app_bar.dart';
import 'package:excellent_trade_app/model/wish_list/wish_list_model.dart';
import 'package:excellent_trade_app/pages/auth/forgot_password/forget_password_export.dart' hide Restaurant;
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:excellent_trade_app/bloc/wish_list/wish_list_bloc.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  late final String userId;

  @override
  void initState() {
    super.initState();
    try {
      userId = SessionController.user.id.toString();
      context.read<WishListBloc>().add(FetchWishListEvent(userId: userId));
    } catch (e) {
      debugPrint("Error initializing FavouriteScreen: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: MyAppBar(
        title: "Favourites",
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: BlocBuilder<WishListBloc, WishListState>(
        builder: (context, state) {
          try {
            if (state.apiResponse.status == Status.loading) {
              return const Center(
                child: CupertinoActivityIndicator(color: Colors.black54),
              );
            }

            if (state.apiResponse.status == Status.error) {
              return _buildMessage(
                state.apiResponse.message ?? "Something went wrong",
                isError: true,
              );
            }

            final restaurants = state.wishListModel.restaurants;

            if (restaurants.isEmpty) {
              return _buildMessage("No favourites yet");
            }

            return ListView.builder(
              padding: const EdgeInsets.all(14),
              itemCount: restaurants.length,
              itemBuilder: (context, index) {
                final restaurant = restaurants[index];
                return _buildRestaurantCard(restaurant);
              },
            );
          } catch (e, stack) {
            debugPrint("Error building FavouriteScreen: $e");
            debugPrint(stack.toString());
            return _buildMessage("Unexpected error occurred", isError: true);
          }
        },
      ),
    );
  }

  /// Widget to show error/empty messages
  Widget _buildMessage(String message, {bool isError = false}) {
    return Center(
      child: Text(
        message,
        style: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: isError ? Colors.red : Colors.grey.shade600,
        ),
      ),
    );
  }

  /// Single Restaurant Card UI
  Widget _buildRestaurantCard(Restaurant restaurant) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withValues(alpha: 0.08),
            blurRadius: 6,
            spreadRadius: 1,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Row(
          children: [
            // Logo with fallback
            Image.network(
              restaurant.logo,
              height: 120,
              width: 120,
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) => Container(
                height: 120,
                width: 120,
                color: Colors.grey.shade200,
                child: const Icon(Icons.restaurant, size: 40),
              ),
            ),

            // Details
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Row: Name + Remove Favourite
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            restaurant.name,
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            try {
                              context.read<WishListBloc>().add(
                                RemoveWishListEvent(
                                  userId: userId,
                                  restaurantId: restaurant.id.toString(),
                                ),
                              );
                            } catch (e) {
                              debugPrint("Error removing favourite: $e");
                            }
                          },
                          child: CircleAvatar(
                            radius: 18,
                            backgroundColor: AppColors.primary.withValues(
                              alpha: .100,
                            ),
                            child: Icon(
                              Icons.favorite,
                              color: AppColors.primary,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 4),

                    // Description
                    Text(
                      restaurant.description,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: Colors.grey.shade600,
                      ),
                    ),

                    const SizedBox(height: 10),

                    // Rating + Status + Hours
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 16,
                          color: Colors.amber.shade600,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          restaurant.rating.toString(),
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        const SizedBox(width: 12),

                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: (restaurant.status == "open")
                                ? Colors.green.shade100
                                : Colors.red.shade100,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            (restaurant.status).toUpperCase(),
                            style: GoogleFonts.poppins(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: (restaurant.status == "open")
                                  ? Colors.green.shade700
                                  : Colors.red.shade700,
                            ),
                          ),
                        ),

                        const SizedBox(width: 12),

                        Icon(
                          Icons.access_time,
                          size: 15,
                          color: Colors.grey.shade500,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "${restaurant.hours}h",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
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
