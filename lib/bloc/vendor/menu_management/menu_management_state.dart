import 'package:equatable/equatable.dart';
import 'package:excellent_trade_app/model/vender/menu_management/menu_category/menu_category_model.dart';
import 'package:excellent_trade_app/model/vender/menu_management/menu_item/menu_item_model.dart';

part of 'menu_management_bloc.dart';

class MenuManagementStates extends Equatable {
  final List<Category> categories;
  final List<Item> items;
  final ApiResponse<List<Category>> categoriesApiResponse;
  final ApiResponse<List<Item>> itemsApiResponse;

  const MenuManagementStates({
    this.categories = const [],
    this.items = const [],
    this.categoriesApiResponse = const ApiResponse.completed([]),
    this.itemsApiResponse = const ApiResponse.completed([]),
  });

  MenuManagementStates copyWith({
    List<Category>? categories,
    List<Item>? items,
    ApiResponse<List<Category>>? categoriesApiResponse,
    ApiResponse<List<Item>>? itemsApiResponse,
  }) {
    return MenuManagementStates(
      categories: categories ?? this.categories,
      items: items ?? this.items,
      categoriesApiResponse:
      categoriesApiResponse ?? this.categoriesApiResponse,
      itemsApiResponse: itemsApiResponse ?? this.itemsApiResponse,
    );
  }

  @override
  List<Object?> get props => [
    categories,
    items,
    categoriesApiResponse,
    itemsApiResponse,
  ];
}
