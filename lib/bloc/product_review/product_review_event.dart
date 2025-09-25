part of 'product_review_bloc.dart';

abstract class ProductReviewEvent extends Equatable {
  const ProductReviewEvent();

  @override
  List<Object?> get props => [];
}

class FetchProductReviewEvent extends ProductReviewEvent {
  final int restaurantId;
  final int menuItemId;

  const FetchProductReviewEvent({
    required this.restaurantId,
    required this.menuItemId,
  });

  @override
  List<Object?> get props => [restaurantId, menuItemId];
}

class AddProductReviewEvent extends ProductReviewEvent {
  final int restaurantId;
  final int menuItemId;
  final int userId;
  final double ratting;
  final String reviewText;

  const AddProductReviewEvent({
    required this.restaurantId,
    required this.menuItemId,
    required this.userId,
    required this.ratting,
    required this.reviewText,
  });

  @override
  List<Object> get props => [
    restaurantId,
    menuItemId,
    userId,
    ratting,
    reviewText,
  ];
}
