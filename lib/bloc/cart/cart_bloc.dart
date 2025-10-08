import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/cart/cart_model.dart';
import '../../service/cart/cart_service.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartSessionController _cartService = CartSessionController();

  CartBloc() : super(CartInitial()) {
    on<LoadCart>(_onLoadCart);
    on<AddOrUpdateCartItem>(_onAddOrUpdateCartItem);
    on<UpdateCartItemQuantity>(_onUpdateCartItemQuantity);
    on<RemoveCartItem>(_onRemoveCartItem);
    on<ClearCart>(_onClearCart);
  }

  Future<void> _onLoadCart(LoadCart event, Emitter<CartState> emit) async {
    emit(CartLoading());
    try {
      await _cartService.loadCart();
      final items = List<CartItemModel>.from(CartSessionController.cartItems);
      emit(CartLoaded(items));
    } catch (e) {
      emit(CartError("Failed to load cart: $e"));
    }
  }

  Future<void> _onAddOrUpdateCartItem(
      AddOrUpdateCartItem event,
      Emitter<CartState> emit,
      ) async {
    try {
      await _cartService.addOrUpdateItem(event.item);
      final items = List<CartItemModel>.from(CartSessionController.cartItems);
      emit(CartLoaded(items));
    } catch (e) {
      emit(CartError("Failed to add/update item: $e"));
    }
  }

  Future<void> _onUpdateCartItemQuantity(
      UpdateCartItemQuantity event,
      Emitter<CartState> emit,
      ) async {
    try {
      await _cartService.updateItemQuantity(event.itemId, event.newQuantity);
      final items = List<CartItemModel>.from(CartSessionController.cartItems);
      emit(CartLoaded(items));
    } catch (e) {
      emit(CartError("Failed to update quantity: $e"));
    }
  }

  Future<void> _onRemoveCartItem(
      RemoveCartItem event,
      Emitter<CartState> emit,
      ) async {
    try {
      await _cartService.removeItem(event.itemId);
      final items = List<CartItemModel>.from(CartSessionController.cartItems);
      emit(CartLoaded(items));
    } catch (e) {
      emit(CartError("Failed to remove item: $e"));
    }
  }

  Future<void> _onClearCart(ClearCart event, Emitter<CartState> emit) async {
    try {
      await _cartService.clearCart();
      emit(CartLoaded([]));
    } catch (e) {
      emit(CartError("Failed to clear cart: $e"));
    }
  }
}
