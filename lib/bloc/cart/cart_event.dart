part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object?> get props => [];
}

class AddOrUpdateCartItem extends CartEvent {
  final CartItemModel item;
  const AddOrUpdateCartItem(this.item);

  @override
  List<Object?> get props => [item];
}

class UpdateCartItemQuantity extends CartEvent {
  final String itemId;
  final int newQuantity;
  const UpdateCartItemQuantity(this.itemId, this.newQuantity);

  @override
  List<Object?> get props => [itemId, newQuantity];
}

class RemoveCartItem extends CartEvent {
  final String itemId;
  const RemoveCartItem(this.itemId);

  @override
  List<Object?> get props => [itemId];
}

class ClearCart extends CartEvent {}

class LoadCart extends CartEvent {}
