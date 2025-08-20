part of 'category_bloc.dart';

class CategoryState extends Equatable {
  final List<int> selectedCategoryIds;
  final List<Categories> categories;
  final ApiResponse<String> categoryApiResponse;

  const CategoryState({
    this.selectedCategoryIds = const [],
    this.categories = const [],
    this.categoryApiResponse = const ApiResponse.completed(''),
  });

  CategoryState copyWith({
    final List<int>? selectedCategoryIds,
    List<Categories>? categories,
    ApiResponse<String>? categoryApiResponse,
  }) {
    return CategoryState(
      selectedCategoryIds: selectedCategoryIds ?? this.selectedCategoryIds,
      categories: categories ?? this.categories,
      categoryApiResponse: categoryApiResponse ?? this.categoryApiResponse,
    );
  }

  @override
  List<Object?> get props => [selectedCategoryIds ,categories, categoryApiResponse];
}
