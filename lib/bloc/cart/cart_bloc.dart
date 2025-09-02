import 'package:excellent_trade_app/bloc/auth/auth_exports.dart';
import 'package:excellent_trade_app/model/cart/cart_model.dart';

import '../../service/cart/cart_service.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartSessionController _cartSessionController = CartSessionController();

  CartBloc() : super(const CartState()) {
    on<LoadCart>((event, emit) async {
      await _cartSessionController.loadCart();
      emit(state.copyWith(items: CartSessionController.cartItems));
    });

    on<AddOrUpdateCartItem>((event, emit) async {
      await _cartSessionController.addOrUpdateItem(event.item);
      emit(state.copyWith(items: CartSessionController.cartItems));
    });

    on<UpdateCartItemQuantity>((event, emit) async {
      await _cartSessionController.updateItemQuantity(
        event.itemId,
        event.newQuantity,
      );
      emit(state.copyWith(items: CartSessionController.cartItems));
    });

    on<RemoveCartItem>((event, emit) async {
      await _cartSessionController.removeItem(event.itemId);
      emit(state.copyWith(items: CartSessionController.cartItems));
    });

    on<ClearCart>((event, emit) async {
      await _cartSessionController.clearCart();
      emit(state.copyWith(items: []));
    });
  }
}
