part of 'recommendation_bloc.dart';

sealed class RecommendationEvent extends Equatable {
  const RecommendationEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FetchRecommendedItemsEvent extends RecommendationEvent {
  final String restaurantId;
  final List<int> cartItem;
  const FetchRecommendedItemsEvent({
    required this.cartItem,
    required this.restaurantId,
  });
  @override
  List<Object> get props => [restaurantId, cartItem];
}
