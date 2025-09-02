part of 'cart_bloc.dart';

class CartState extends Equatable {
  final List<CartItemModel> items;
  final ApiResponse<String> apiResponse;

  const CartState({
    this.items = const [],
    this.apiResponse = const ApiResponse.completed(''),
  });

  CartState copyWith({
    List<CartItemModel>? items,
    ApiResponse<String>? apiResponse,
  }) {
    return CartState(
      items: items ?? this.items,
      apiResponse: apiResponse ?? this.apiResponse,
    );
  }

  @override
  List<Object?> get props => [items, apiResponse];
}
