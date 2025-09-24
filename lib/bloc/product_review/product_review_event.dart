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
