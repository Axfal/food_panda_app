// ignore_for_file: avoid_print
import 'package:excellent_trade_app/bloc/auth/auth_exports.dart';
import 'package:excellent_trade_app/model/category/category_model.dart';
import 'package:excellent_trade_app/repository/category/category_api_repository.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryApiRepository categoryApiRepository;
  CategoryBloc({required this.categoryApiRepository}) : super(CategoryState()) {
    on<FetchCategoriesEvent>(_onFetchCategories);
    on<AddCategoryIdEvent>(_onAddCategoryId);
    on<RemoveCategoryIdEvent>(_onRemoveCategoryId);
  }

  void _onFetchCategories(
    FetchCategoriesEvent event,
    Emitter<CategoryState> emit,
  ) async {
    emit(state.copyWith(categoryApiResponse: ApiResponse.loading()));

    try {
      if (state.categories.isNotEmpty) return;

      final response = await categoryApiRepository.fetchCategories();

      if (response != null) {
        final categoriesModel = CategoriesModel.fromJson(response);

        if (categoriesModel.success) {
          emit(
            state.copyWith(
              categories: categoriesModel.categories,
              categoryApiResponse: ApiResponse.completed('Categories loaded'),
            ),
          );
        } else {
          emit(
            state.copyWith(
              categoryApiResponse: ApiResponse.error(categoriesModel.error),
            ),
          );
        }
      } else {
        print('No response from server');
        emit(
          state.copyWith(
            categoryApiResponse: ApiResponse.error('No response from server'),
          ),
        );
      }
    } catch (e) {
      print('Error: $e');
      emit(
        state.copyWith(categoryApiResponse: ApiResponse.error(e.toString())),
      );
    }
  }

  void _onAddCategoryId(AddCategoryIdEvent event, Emitter<CategoryState> emit) {
    final updatedIds = List<int>.from(state.selectedCategoryIds);
    print("ids => $updatedIds");
    if (!updatedIds.contains(event.id)) {
      updatedIds.add(event.id);
    }
    emit(state.copyWith(selectedCategoryIds: updatedIds));
  }

  void _onRemoveCategoryId(
    RemoveCategoryIdEvent event,
    Emitter<CategoryState> emit,
  ) {
    final updatedIds = List<int>.from(state.selectedCategoryIds);
    updatedIds.remove(event.id);
    emit(state.copyWith(selectedCategoryIds: updatedIds));
  }
}
