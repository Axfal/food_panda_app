// ignore_for_file: avoid_print

import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:excellent_trade_app/dependency_injection/dependency_injection.dart';
import 'package:excellent_trade_app/model/vender/menu_management/menu_category/menu_category_model.dart';
import 'package:excellent_trade_app/model/vender/menu_management/menu_item/menu_item_model.dart';
import '../../../data/response/api_response.dart';

part 'menu_management_event.dart';
part 'menu_management_state.dart';

class MenuManagementBloc
    extends Bloc<MenuManagementEvent, MenuManagementStates> {
  VendorApiRepository vendorApiRepository;

  MenuManagementBloc({required this.vendorApiRepository})
    : super(const MenuManagementStates()) {
    /// Category events
    on<FetchCategoriesEvent>(_onFetchCategory);
    on<AddCategoryEvent>(_onAddCategory);
    on<UpdateCategoryEvent>(_onUpdateCategory);
    on<DeleteCategoryEvent>(_onDeleteCategory);

    /// Item events
    on<FetchItemsEvent>(_onFetchItem);
    on<AddItemEvent>(_onAddItem);
    on<UpdateItemEvent>(_onUpdateItem);
    on<DeleteItemEvent>(_onDeleteItem);
  }

  /// Fetch categories
  void _onFetchCategory(
    FetchCategoriesEvent event,
    Emitter<MenuManagementStates> emit,
  ) async {
    emit(state.copyWith(categoriesApiResponse: const ApiResponse.loading()));

    try {
      final response = await vendorApiRepository.fetchMenuCategory();

      if (response is Map<String, dynamic>) {
        final categoryModel = MenuCategoryModel.fromJson(response);

        if (categoryModel.success) {
          emit(
            state.copyWith(
              categories: categoryModel.categories,
              categoriesApiResponse: ApiResponse.completed(
                categoryModel.categories,
              ),
            ),
          );
        } else {
          emit(
            state.copyWith(
              categoriesApiResponse: ApiResponse.error(
                categoryModel.error.isNotEmpty
                    ? categoryModel.error
                    : 'Failed to fetch categories',
              ),
            ),
          );
        }
      } else {
        emit(
          state.copyWith(
            categoriesApiResponse: const ApiResponse.error(
              'Invalid response format',
            ),
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(categoriesApiResponse: ApiResponse.error(e.toString())),
      );
    }
  }

  void _onAddCategory(
    AddCategoryEvent event,
    Emitter<MenuManagementStates> emit,
  ) {}
  void _onDeleteCategory(
    DeleteCategoryEvent event,
    Emitter<MenuManagementStates> emit,
  ) {}
  void _onUpdateCategory(
    UpdateCategoryEvent event,
    Emitter<MenuManagementStates> emit,
  ) {}

  /// Fetch items for a specific category and cache results
  void _onFetchItem(
    FetchItemsEvent event,
    Emitter<MenuManagementStates> emit,
  ) async {
    /// If items for this category already exist, skip API call
    if (state.itemsByCategory.containsKey(event.categoryId) &&
        state.refreshItem == false) {
      return;
    }

    emit(state.copyWith(itemsApiResponse: const ApiResponse.loading()));

    try {
      final response = await vendorApiRepository.fetchMenuItem(
        event.restaurantId,
        event.categoryId,
      );

      if (response is Map<String, dynamic>) {
        final itemModel = MenuItemModel.fromJson(response);

        if (itemModel.success) {
          final updatedItemsByCategory = Map<String, List<Item>>.from(
            state.itemsByCategory,
          )..[event.categoryId] = itemModel.items;

          emit(
            state.copyWith(
              itemsByCategory: updatedItemsByCategory,
              itemsApiResponse: ApiResponse.completed(itemModel.items),
            ),
          );
        } else {
          emit(
            state.copyWith(
              itemsApiResponse: ApiResponse.error(
                itemModel.error.isNotEmpty
                    ? itemModel.error
                    : 'Failed to fetch items',
              ),
            ),
          );
        }
      } else {
        emit(
          state.copyWith(
            itemsApiResponse: const ApiResponse.error(
              'Invalid response format',
            ),
          ),
        );
      }
    } catch (e) {
      emit(state.copyWith(itemsApiResponse: ApiResponse.error(e.toString())));
    }
  }

  void _onAddItem(
    AddItemEvent event,
    Emitter<MenuManagementStates> emit,
  ) async {
    emit(state.copyWith(itemsApiResponse: const ApiResponse.loading()));

    final Map<String, dynamic> data = {
      "restaurant_id": event.restaurantId,
      "category_id": event.categoryId,
      "name": event.name,
      "description": event.description,
      "price": event.price,
      "status": "available",
      "photo": event.photo,
    };
    print("data =============>  $data");

    try {
      final response = await vendorApiRepository.addMenuItem(data);

      if (response != null) {
        if (response['success'] == true && response['message'] != null) {
          emit(
            state.copyWith(
              itemsApiResponse: ApiResponse.completed(response['message']),
            ),
          );
        } else {
          emit(
            state.copyWith(
              itemsApiResponse: ApiResponse.error(
                response['error'] ?? 'Failed to add item',
              ),
            ),
          );
        }
      } else {
        emit(
          state.copyWith(
            itemsApiResponse: const ApiResponse.error(
              'No response from server',
            ),
          ),
        );
      }
    } catch (e) {
      emit(state.copyWith(itemsApiResponse: ApiResponse.error(e.toString())));
    }
  }

  void _onUpdateItem(
    UpdateItemEvent event,
    Emitter<MenuManagementStates> emit,
  ) {}

  void _onDeleteItem(
    DeleteItemEvent event,
    Emitter<MenuManagementStates> emit,
  ) async {
    final updatedItemsByCategory = Map<String, List<Item>>.from(
      state.itemsByCategory,
    );

    final items = updatedItemsByCategory[event.categoryId];

    if (items != null) {
      final filteredItems = items
          .where((item) => item.id.toString() != event.itemId)
          .toList();

      updatedItemsByCategory[event.categoryId] = filteredItems;

      emit(
        state.copyWith(
          itemsByCategory: updatedItemsByCategory,
          itemsApiResponse: ApiResponse.completed(filteredItems),
        ),
      );
    }
    Map<String, dynamic> data = {
      "id": event.itemId,
      "restaurant_id": event.restaurantId,
    };

    print("data ====>>>>> $data");
    try {
      final response = await vendorApiRepository.deleteMenuItem(data);
      if (response != null) {
        if (response['success'] == true && response['message'] != null) {
          emit(
            state.copyWith(
              itemsApiResponse: ApiResponse.completed(response['message']),
            ),
          );
        } else {
          emit(state.copyWith(itemsApiResponse: response['error']));
        }
      } else {
        print('no response from server');
      }
    } catch (e) {}
  }
}
