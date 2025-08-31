part of 'wish_list_bloc.dart';

sealed class WishListEvent extends Equatable {
  const WishListEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FetchWishListEvent extends WishListEvent {
  final String userId;
  const FetchWishListEvent({required this.userId});
  @override
  // TODO: implement props
  List<Object?> get props => [userId];
}

class RemoveWishListEvent extends WishListEvent {
  final String userId;
  final String restaurantId;
  final String action;
  const RemoveWishListEvent({
    required this.userId,
    required this.restaurantId,
    this.action = 'remove',
  });
  @override
  // TODO: implement props
  List<Object?> get props => [userId, restaurantId, action];
}

class AddWishListEvent extends WishListEvent {
  final String userId;
  final String restaurantId;
  final String action;
  const AddWishListEvent({
    required this.userId,
    required this.restaurantId,
    this.action = 'add',
  });
  @override
  // TODO: implement props
  List<Object?> get props => [userId, restaurantId, action];
}
