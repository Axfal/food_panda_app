part of 'menu_management_bloc.dart';

class MenuManagementStates extends Equatable {
  final List<Category> categories;
  final Map<String, List<Item>> itemsByCategory;
  final ApiResponse<List<Category>> categoriesApiResponse;
  final ApiResponse<List<Item>> itemsApiResponse;

  const MenuManagementStates({
    this.categories = const [],
    this.itemsByCategory = const {},
    this.categoriesApiResponse = const ApiResponse.completed([]),
    this.itemsApiResponse = const ApiResponse.completed([]),
  });

  MenuManagementStates copyWith({
    List<Category>? categories,
    Map<String, List<Item>>? itemsByCategory,
    ApiResponse<List<Category>>? categoriesApiResponse,
    ApiResponse<List<Item>>? itemsApiResponse,
  }) {
    return MenuManagementStates(
      categories: categories ?? this.categories,
      itemsByCategory: itemsByCategory ?? this.itemsByCategory,
      categoriesApiResponse:
          categoriesApiResponse ?? this.categoriesApiResponse,
      itemsApiResponse: itemsApiResponse ?? this.itemsApiResponse,
    );
  }

  @override
  List<Object?> get props => [
    categories,
    itemsByCategory,
    categoriesApiResponse,
    itemsApiResponse,
  ];
}
