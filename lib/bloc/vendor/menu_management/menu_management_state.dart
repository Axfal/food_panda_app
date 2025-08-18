part of 'menu_management_bloc.dart';

class MenuManagementStates extends Equatable {
  final bool refreshItem;
  final List<Category> categories;
  final Item item;
  final Map<String, List<Item>> itemsByCategory;
  final ApiResponse<List<Category>> categoriesApiResponse;
  final ApiResponse<List<Item>> itemsApiResponse;

  const MenuManagementStates({
    this.refreshItem = false,
    this.categories = const [],
    this.itemsByCategory = const {},
    this.item = const Item(),
    this.categoriesApiResponse = const ApiResponse.completed([]),
    this.itemsApiResponse = const ApiResponse.completed([]),
  });

  MenuManagementStates copyWith({
    bool? refreshItem,
    List<Category>? categories,
    Item? item,
    Map<String, List<Item>>? itemsByCategory,
    ApiResponse<List<Category>>? categoriesApiResponse,
    ApiResponse<List<Item>>? itemsApiResponse,
  }) {
    return MenuManagementStates(
      categories: categories ?? this.categories,
      refreshItem: refreshItem ?? this.refreshItem,
      itemsByCategory: itemsByCategory ?? this.itemsByCategory,
      item: item ?? this.item,
      categoriesApiResponse:
          categoriesApiResponse ?? this.categoriesApiResponse,
      itemsApiResponse: itemsApiResponse ?? this.itemsApiResponse,
    );
  }

  @override
  List<Object?> get props => [
    categories,
    item,
    refreshItem,
    itemsByCategory,
    categoriesApiResponse,
    itemsApiResponse,
  ];
}
