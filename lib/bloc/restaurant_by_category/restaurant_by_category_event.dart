part of 'restaurant_by_category_bloc.dart';

sealed class RestaurantByCategoryEvent extends Equatable {
  const RestaurantByCategoryEvent();

  @override
  List<Object?> get props => [];
}

class FetchRestaurantsByCategoryEvent extends RestaurantByCategoryEvent {
  final int categoryId;

  const FetchRestaurantsByCategoryEvent({required this.categoryId});

  @override
  List<Object?> get props => [categoryId];
}
