import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:excellent_trade_app/model/cart/cart_model.dart';
import '../storage/local_storage.dart';

class CartSessionController {
  final LocalStorage _localStorage = LocalStorage();

  static final CartSessionController _instance =
      CartSessionController._internal();

  static List<CartItemModel> cartItems = [];

  CartSessionController._internal() {
    _loadCartOnStart();
  }

  factory CartSessionController() => _instance;

  Future<void> addOrUpdateItem(CartItemModel item) async {
    try {
      final index = cartItems.indexWhere((cartItem) => cartItem.id == item.id);

      if (index != -1) {
        cartItems[index] = cartItems[index].copyWith(
          quantity: (cartItems[index].quantity + item.quantity),
        );
      } else {
        // Add new item
        cartItems.add(item);
      }

      await _persistCart();
    } catch (e) {
      debugPrint("Error adding/updating cart item: $e");
    }
  }

  bool isItemInCart(String itemId) {
    return cartItems.any((item) => item.id == itemId);
  }

  CartItemModel? getCartItem(String itemId) {
    try {
      return cartItems.firstWhere((item) => item.id == itemId);
    } catch (e) {
      return null; // Item not found
    }
  }


  Future<void> updateItemQuantity(String itemId, int newQuantity) async {
    try {
      final index = cartItems.indexWhere((item) => item.id == itemId);
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

  Future<void> removeItem(String itemId) async {
    try {
      cartItems.removeWhere((item) => item.id == itemId);
      await _persistCart();
    } catch (e) {
      debugPrint("Error removing item: $e");
    }
  }

  Future<void> clearCart() async {
    try {
      cartItems.clear();
      await _localStorage.clearValue('cart_items');
    } catch (e) {
      debugPrint("Error clearing cart: $e");
    }
  }

  Future<void> _persistCart() async {
    final cartJson = jsonEncode(cartItems.map((e) => e.toJson()).toList());
    await _localStorage.setValue('cart_items', cartJson);
  }

  Future<void> _loadCartOnStart() async {
    try {
      final storedData = await _localStorage.readValue('cart_items');
      if (storedData.isNotEmpty) {
        final List decoded = jsonDecode(storedData);
        cartItems = decoded.map((e) => CartItemModel.fromJson(e)).toList();
      } else {
        cartItems = [];
      }
    } catch (e) {
      debugPrint('Error loading cart: $e');
      cartItems = [];
    }
  }

  Future<void> loadCart() async {
    await _loadCartOnStart();
  }


  /// Getters
  int get cartCount => cartItems.length;

  double get cartTotal =>
      cartItems.fold(0.0, (sum, item) => sum + (item.price * item.quantity));

  bool get hasItems => cartItems.isNotEmpty;
}
