import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:excellent_trade_app/model/cart/cart_model.dart';
import '../storage/local_storage.dart';

class CartSessionController {
  final LocalStorage _localStorage = LocalStorage();

  static final CartSessionController _instance =
      CartSessionController._internal();

  static List<CartItemModel> cartItems = [];
  static String? currentRestaurantId;

  CartSessionController._internal() {
    _loadCartOnStart();
  }

  factory CartSessionController() => _instance;

  Future<void> addOrUpdateItem(CartItemModel item) async {
    try {
      if (currentRestaurantId != null &&
          currentRestaurantId != item.restaurantId) {
        await clearCart();
      }

      currentRestaurantId ??= item.restaurantId;

      final index = cartItems.indexWhere(
        (cartItem) =>
            cartItem.id == item.id && cartItem.variationId == item.variationId,
      );

      if (index != -1) {
        cartItems[index] = cartItems[index].copyWith(
          quantity: cartItems[index].quantity + item.quantity,
        );
      } else {
        cartItems.add(item);
      }

      await _persistCart();
    } catch (e) {
      debugPrint("Error adding/updating cart item: $e");
    }
  }

  Future<void> clearCart() async {
    try {
      cartItems.clear();
      currentRestaurantId = null;
      await _localStorage.clearValue('cart_items');
      await _localStorage.clearValue('current_restaurant');
    } catch (e) {
      debugPrint("Error clearing cart: $e");
    }
  }

  Future<void> _persistCart() async {
    final cartJson = jsonEncode(cartItems.map((e) => e.toJson()).toList());
    await _localStorage.setValue('cart_items', cartJson);

    if (currentRestaurantId != null) {
      await _localStorage.setValue('current_restaurant', currentRestaurantId!);
    }
  }

  Future<void> _loadCartOnStart() async {
    try {
      final String? storedData = await _localStorage.readValue('cart_items');
      if (storedData != null && storedData.isNotEmpty) {
        final List decoded = jsonDecode(storedData);
        cartItems = decoded.map((e) => CartItemModel.fromJson(e)).toList();
      } else {
        cartItems = [];
      }

      final String? restaurant = await _localStorage.readValue(
        'current_restaurant',
      );
      currentRestaurantId = (restaurant != null && restaurant.isNotEmpty)
          ? restaurant
          : null;
    } catch (e) {
      debugPrint('Error loading cart: $e');
      cartItems = [];
      currentRestaurantId = null;
    }
  }

  Future<void> loadCart() async {
    await _loadCartOnStart();
  }

  bool isItemInCart(String itemId, {int? variationId}) {
    return cartItems.any(
      (item) =>
          item.id == itemId &&
          (item.variationId == variationId || variationId == null),
    );
  }

  CartItemModel? getCartItem(String itemId, {int? variationId}) {
    try {
      return cartItems.firstWhere(
        (item) =>
            item.id == itemId &&
            (variationId == null || item.variationId == variationId),
      );
    } catch (e) {
      return null; // Item not found
    }
  }

  Future<void> updateItemQuantity(
    String itemId,
    int newQuantity, {
    int? variationId,
  }) async {
    try {
      final index = cartItems.indexWhere(
        (item) =>
            item.id == itemId &&
            (variationId == null || item.variationId == variationId),
      );
      if (index != -1) {
        if (newQuantity <= 0) {
          cartItems.removeAt(index);
        } else {
          cartItems[index] = cartItems[index].copyWith(quantity: newQuantity);
        }
        await _persistCart();
      }
    } catch (e) {
      debugPrint("Error updating quantity: $e");
    }
  }

  Future<void> removeItem(String itemId, {int? variationId}) async {
    try {
      cartItems.removeWhere(
        (item) =>
            item.id == itemId &&
            (variationId == null || item.variationId == variationId),
      );
      await _persistCart();
    } catch (e) {
      debugPrint("Error removing item: $e");
    }
  }

  /// Getters
  int get cartCount => cartItems.length;

  double get cartTotal =>
      cartItems.fold(0.0, (sum, item) => sum + (item.price * item.quantity));

  bool get hasItems => cartItems.isNotEmpty;

  String? get restaurantId => currentRestaurantId;

  List<int?> get variationIds => cartItems.map((e) => e.variationId).toList();
}
