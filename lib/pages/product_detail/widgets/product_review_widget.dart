import 'package:excellent_trade_app/pages/auth/forgot_password/forget_password_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:excellent_trade_app/bloc/product_review/product_review_bloc.dart';

import '../../../Utils/constants/app_colors.dart';
import '../../../data/response/status.dart';

/// Small preview box shown on product detail screen
Widget productReviewBox(
  BuildContext context, {
  required int restaurantId,
  required int menuItemId,
}) {
  return GestureDetector(
    onTap: () => showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) =>
          ReviewBottomSheet(restaurantId: restaurantId, menuItemId: menuItemId),
    ),
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primary, width: 1.5),
      ),
      child: BlocBuilder<ProductReviewBloc, ProductReviewState>(
        builder: (context, state) {
          final reviews = state.getProductReviewModel?.reviews ?? [];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Customer Reviews",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),
              if (state.apiResponse.status == Status.loading)
                const Center(child: CircularProgressIndicator())
              else if (reviews.isEmpty)
                Text("No reviews yet", style: GoogleFonts.poppins(fontSize: 14))
              else ...[
                // show first 2 reviews only
                _reviewItem(
                  reviews.first.userName ?? '',
                  reviews.first.reviewText ?? '',
                  reviews.first.rating ?? 0.0,
                ),
                if (reviews.length > 1) ...[
                  const SizedBox(height: 8),
                  _reviewItem(
                    reviews[1].userName ?? '',
                    reviews[1].reviewText ?? '',
                    reviews[1].rating ?? 0.0,
                  ),
                ],
              ],
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "See all reviews",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: AppColors.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                    color: AppColors.primary,
                  ),
                ],
              ),
            ],
          );
        },
      ),
    ),
  );
}

Widget _reviewItem(String name, String review, double rating) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          CircleAvatar(
            radius: 14,
            backgroundColor: AppColors.primary,
            child: Text(
              name.isNotEmpty ? name[0] : '?',
              style: const TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            name,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          const SizedBox(width: 6),
          Row(
            children: List.generate(5, (index) {
              final starIndex = index + 1;

              if (rating >= starIndex) {
                // full star
                return const Icon(Icons.star, size: 14, color: Colors.amber);
              } else if (rating >= starIndex - 0.5) {
                // half star
                return const Icon(
                  Icons.star_half,
                  size: 14,
                  color: Colors.amber,
                );
              } else {
                // empty star
                return const Icon(
                  Icons.star_border,
                  size: 14,
                  color: Colors.amber,
                );
              }
            }),
          ),
        ],
      ),
      const SizedBox(height: 4),
      Text(
        review,
        style: GoogleFonts.poppins(fontSize: 13, color: Colors.black87),
      ),
    ],
  );
}

/// Full bottom sheet listing all reviews
class ReviewBottomSheet extends StatelessWidget {
  final int restaurantId;
  final int menuItemId;

  const ReviewBottomSheet({
    super.key,
    required this.restaurantId,
    required this.menuItemId,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.8,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        builder: (context, scrollController) {
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 50,
                    height: 5,
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Text(
                  "All Reviews",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: BlocBuilder<ProductReviewBloc, ProductReviewState>(
                    builder: (context, state) {
                      if (state.apiResponse.status == Status.loading) {
                        return const Center(
                          child: CupertinoActivityIndicator(
                            color: Colors.black54,
                          ),
                        );
                      }
                      final reviews =
                          state.getProductReviewModel?.reviews ?? [];
                      if (reviews.isEmpty) {
                        return Center(
                          child: Text(
                            "No reviews yet",
                            style: GoogleFonts.poppins(fontSize: 14),
                          ),
                        );
                      }
                      return ListView.separated(
                        controller: scrollController,
                        itemCount: reviews.length,
                        separatorBuilder: (_, _) => const Divider(),
                        itemBuilder: (context, index) {
                          final r = reviews[index];
                          return _reviewItem(
                            r.userName ?? '',
                            r.reviewText ?? '',
                            r.rating ?? 0,
                          );
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 55,
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: () {
                      // close current bottom sheet first
                      Navigator.pop(context);

                      // open Add Review bottom sheet
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        builder: (context) => AddReviewBottomSheet(
                          restaurantId: restaurantId,
                          menuItemId: menuItemId,
                        ),
                      );
                    },

                    icon: const Icon(Icons.edit, color: Colors.white),
                    label: Text(
                      "Write a Review",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class AddReviewBottomSheet extends StatefulWidget {
  final int restaurantId;
  final int menuItemId;

  const AddReviewBottomSheet({
    super.key,
    required this.restaurantId,
    required this.menuItemId,
  });

  @override
  State<AddReviewBottomSheet> createState() => _AddReviewBottomSheetState();
}

class _AddReviewBottomSheetState extends State<AddReviewBottomSheet> {
  double selectedRating = 0.0;
  final TextEditingController reviewController = TextEditingController();
  bool _isSubmitting = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // drag indicator
                Center(
                  child: Container(
                    width: 40,
                    height: 5,
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Text(
                  "Write a Review",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 12),

                // rating stars
                Center(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(5, (index) {
                          final starIndex = index + 1;
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedRating = starIndex.toDouble();
                              });
                            },
                            child: Icon(
                              selectedRating >= starIndex
                                  ? Icons.star_rounded
                                  : Icons.star_border_rounded,
                              size: 40,
                              color: selectedRating >= starIndex
                                  ? Colors.amber
                                  : Colors.grey[400],
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        selectedRating == 0
                            ? "Tap to rate"
                            : "You rated ${selectedRating.toInt()} star${selectedRating > 1 ? 's' : ''}",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // text area
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: reviewController,
                        cursorColor: Colors.black54,
                        maxLines: 6,
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87,
                        ),
                        decoration: InputDecoration(
                          hintText: "Share your experience...",
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.grey[500],
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {});
                        },
                      ),
                    ),
                    const SizedBox(height: 6),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "${reviewController.text.length}/5000",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.grey[500],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // submit button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    onPressed: _isSubmitting
                        ? null
                        : () async {
                            if (selectedRating == 0.0) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Please select a rating"),
                                ),
                              );
                              return;
                            }
                            if (reviewController.text.trim().isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Please write your review"),
                                ),
                              );
                              return;
                            }

                            setState(() => _isSubmitting = true);

                            context.read<ProductReviewBloc>().add(
                              AddProductReviewEvent(
                                restaurantId: 6,
                                menuItemId: 32,
                                userId: 10,
                                ratting: selectedRating,
                                reviewText: reviewController.text.trim(),
                              ),
                            );

                            Future.delayed(
                              const Duration(milliseconds: 400),
                              () {
                                Navigator.pop(context);
                                context.flushBarSuccessMessage(
                                  message: "Review submitted!",
                                );
                              },
                            );

                            setState(() => _isSubmitting = false);
                          },
                    child: _isSubmitting
                        ? const SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            "Submit Review",
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
