part of 'cart_bloc.dart';

class CartState extends Equatable {
  final List<CartItemModel> items;
  final ApiResponse<String> apiResponse;
  final String? restaurantId;

  const CartState({
    this.items = const [],
    this.apiResponse = const ApiResponse.completed(''),
    this.restaurantId,
  });

  CartState copyWith({
    List<CartItemModel>? items,
    ApiResponse<String>? apiResponse,
    String? restaurantId,
  }) {
    return CartState(
      items: items ?? this.items,
      apiResponse: apiResponse ?? this.apiResponse,
      restaurantId: restaurantId ?? this.restaurantId,
    );
  }

  @override
  List<Object?> get props => [items, apiResponse, restaurantId];
}
