import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/cart/cart_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<LoadCart>(_onLoadCart);
    on<AddOrUpdateCartItem>(_onAddOrUpdateCartItem);
    on<UpdateCartItemQuantity>(_onUpdateCartItemQuantity);
    on<RemoveCartItem>(_onRemoveCartItem);
    on<ClearCart>(_onClearCart);
  }

  void _onLoadCart(LoadCart event, Emitter<CartState> emit) {
    emit(CartLoaded([]));
  }

  void _onAddOrUpdateCartItem(
    AddOrUpdateCartItem event,
    Emitter<CartState> emit,
  ) {
    if (state is CartLoaded) {
      final loadedState = state as CartLoaded;
      final items = List<CartItemModel>.from(loadedState.items);

      final index = items.indexWhere((i) => i.id == event.item.id);
      if (index != -1) {
        items[index] = event.item.copyWith(
          quantity: items[index].quantity + event.item.quantity,
        );
      } else {
        items.add(event.item);
      }

      emit(CartLoaded(items));
    }
  }

  void _onUpdateCartItemQuantity(
    UpdateCartItemQuantity event,
    Emitter<CartState> emit,
  ) {
    if (state is CartLoaded) {
      final loadedState = state as CartLoaded;
      final items = List<CartItemModel>.from(loadedState.items);

      final index = items.indexWhere((i) => i.id == event.itemId);
      if (index != -1) {
        final item = items[index];
        items[index] = item.copyWith(quantity: event.newQuantity);
      }

      emit(CartLoaded(items));
    }
  }

  void _onRemoveCartItem(RemoveCartItem event, Emitter<CartState> emit) {
    if (state is CartLoaded) {
      final loadedState = state as CartLoaded;
      final items = loadedState.items
          .where((i) => i.id != event.itemId)
          .toList();
      emit(CartLoaded(items));
    }
  }

  void _onClearCart(ClearCart event, Emitter<CartState> emit) {
    emit(CartLoaded([]));
  }
}
