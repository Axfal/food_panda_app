// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:excellent_trade_app/dependency_injection/dependency_injection.dart';
import 'package:excellent_trade_app/model/vender/menu_management/menu_category/menu_category_model.dart';
import 'package:excellent_trade_app/model/vender/menu_management/menu_item/menu_item_model.dart';
import 'package:excellent_trade_app/repository/auth/auth_repository.dart';
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

    Map<String, dynamic> data = {"restaurant_id": event.restaurantId};

    try {
      final response = await vendorApiRepository.fetchMenuCategory(data);

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
  ) async {
    // emit(state.copyWith(categoriesApiResponse: const ApiResponse.loading()));

    final Map<String, dynamic> data = {
      "restaurant_id": event.restaurantId,
      "categories[]": event.categoryName,
      "photos[]": event.image,
    };

    try {
      final response = await vendorApiRepository.addMenuCategory(data);

      if (response != null) {
        if (response['success'] == true) {
          final List<dynamic> cats = response['categories'] ?? [];

          final Map<String, dynamic> cat = cats.first;

          final newCategory = Category(
            id: int.tryParse(cat['id'].toString()) ?? 0,
            restaurantId: int.tryParse(event.restaurantId) ?? 0,
            name: cat['name'] ?? event.categoryName,
            photo: '${AppUrl.baseUrl}/${cat['photo'] ?? ''}',
          );

          final updatedCategories = List<Category>.from(state.categories)
            ..add(newCategory);

          emit(
            state.copyWith(
              categories: updatedCategories,
              categoriesApiResponse: ApiResponse.completed(updatedCategories),
            ),
          );
        } else {
          emit(
            state.copyWith(
              categoriesApiResponse: ApiResponse.error(
                response['error'] ?? 'Failed to add category',
              ),
            ),
          );
        }
      } else {
        emit(
          state.copyWith(
            categoriesApiResponse: const ApiResponse.error(
              'No response from server',
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

  void _onDeleteCategory(
    DeleteCategoryEvent event,
    Emitter<MenuManagementStates> emit,
  ) async {
    // emit(state.copyWith(categoriesApiResponse: const ApiResponse.loading()));

    final Map<String, dynamic> data = {
      "id": event.categoryId,
      "restaurant_id": event.restaurantId,
    };

    try {
      final response = await vendorApiRepository.deleteMenuCategory(data);

      if (response != null) {
        if (response['success'] == true) {
          final updatedCategories = state.categories
              .where((c) => c.id.toString() != event.categoryId)
              .toList();

          emit(
            state.copyWith(
              categories: updatedCategories,
              categoriesApiResponse: ApiResponse.completed(updatedCategories),
            ),
          );
        } else {
          emit(
            state.copyWith(
              categoriesApiResponse: ApiResponse.error(
                response['error'] ?? 'Delete failed',
              ),
            ),
          );
        }
      } else {
        emit(
          state.copyWith(
            categoriesApiResponse: const ApiResponse.error(
              'No response from server',
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

  void _onUpdateCategory(
    UpdateCategoryEvent event,
    Emitter<MenuManagementStates> emit,
  ) async {
    // emit(state.copyWith(categoriesApiResponse: const ApiResponse.loading()));

    final Map<String, dynamic> data = {
      "id": event.categoryId,
      "restaurant_id": event.restaurantId,
    };

    if (event.name != null && event.name!.isNotEmpty) {
      data["name"] = event.name;
    }
    if (event.photo != null) {
      data["photo"] = event.photo;
    }

    try {
      final response = await vendorApiRepository.updateMenuCategory(data);

      if (response != null) {
        if (response['success'] == true) {
          final updatedCategories = state.categories.map((c) {
            if (c.id.toString() == event.categoryId) {
              return c.copyWith(
                name: event.name ?? c.name,
                photo: '${AppUrl.baseUrl}/${response['category']['photo']}',
              );
            }
            return c;
          }).toList();

          emit(
            state.copyWith(
              categories: updatedCategories,
              categoriesApiResponse: ApiResponse.completed(updatedCategories),
            ),
          );
        } else {
          emit(
            state.copyWith(
              categoriesApiResponse: ApiResponse.error(
                response['error'] ?? 'Update failed',
              ),
            ),
          );
        }
      } else {
        emit(
          state.copyWith(
            categoriesApiResponse: const ApiResponse.error(
              'No response from server',
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

  void _onFetchItem(
    FetchItemsEvent event,
    Emitter<MenuManagementStates> emit,
  ) async {
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
    // emit(state.copyWith(itemsApiResponse: const ApiResponse.loading()));

    final Map<String, dynamic> data = {
      "restaurant_id": event.restaurantId,
      "category_id": event.categoryId,
      "name": event.name,
      "description": event.description,
      "price": event.price,
      "status": event.status,
      "photo": event.photo,
      "variations": event.variations.map((v) => v.toJson()).toList(),
    };

    print("add-item data => $data");

    try {
      final response = await vendorApiRepository.addMenuItem(data);

      if (response != null && response['success'] == true) {
        final newItem = Item(
          id: int.tryParse(response['item_id'].toString()) ?? 0,
          restaurantId: int.parse(event.restaurantId),
          categoryId: int.parse(event.categoryId),
          status: event.status,
          name: event.name,
          description: event.description,
          photo: response['photo_url'] ?? '',
          price: event.price,
          variations: event.variations,
        );

        final updatedItemsByCategory = Map<String, List<Item>>.from(
          state.itemsByCategory,
        );

        final existingItems = List<Item>.from(
          updatedItemsByCategory[event.categoryId] ?? [],
        );
        existingItems.add(newItem);

        updatedItemsByCategory[event.categoryId] = existingItems;

        emit(
          state.copyWith(
            itemsByCategory: updatedItemsByCategory,

            itemsApiResponse: ApiResponse.completed(existingItems),
          ),
        );
      } else {
        emit(
          state.copyWith(
            itemsApiResponse: ApiResponse.error(
              response?['error'] ?? 'Failed to add item',
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
  ) async {
    // emit(state.copyWith(itemsApiResponse: const ApiResponse.loading()));

    final validVariations = event.variations
        .where((v) => v.name.isNotEmpty && v.price.isNotEmpty)
        .map((v) => v.toJson())
        .toList();

    final Map<String, dynamic> data = {
      "id": event.itemId,
      "restaurant_id": event.restaurantId,
      "category_id": event.categoryId,
      if (event.name.isNotEmpty) "name": event.name,
      if (event.description.isNotEmpty) "description": event.description,
      if (event.price.isNotEmpty) "price": event.price,
      if (event.status.isNotEmpty) "status": event.status,
      if (event.photo != null &&
          event.photo is File &&
          (event.photo as File).path.isNotEmpty)
        "photo": event.photo,
      "variations": jsonEncode(validVariations),
    };

    print("update-item data => $data");

    try {
      final response = await vendorApiRepository.updateMenuItem(data);

      if (response != null && response['success'] == true) {
        final updatedItemsByCategory = Map<String, List<Item>>.from(
          state.itemsByCategory,
        );

        final items = List<Item>.from(
          updatedItemsByCategory[event.categoryId] ?? [],
        );

        final itemIndex = items.indexWhere(
          (item) => item.id.toString() == event.itemId,
        );

        if (itemIndex != -1) {
          final oldItem = items[itemIndex];

          final updatedItem = Item(
            id: oldItem.id,
            restaurantId: oldItem.restaurantId,
            categoryId: oldItem.categoryId,
            name: event.name.isNotEmpty ? event.name : oldItem.name,
            description: event.description.isNotEmpty
                ? event.description
                : oldItem.description,
            price: event.price.isNotEmpty ? event.price : oldItem.price,
            status: event.status.isNotEmpty ? event.status : oldItem.status,
            photo: "${AppUrl.baseUrl}/${response['item']['photo'] ?? ''}",
            variations: event.variations.isNotEmpty
                ? event.variations
                : oldItem.variations,
          );

          items[itemIndex] = updatedItem;
          updatedItemsByCategory[event.categoryId] = items;
        }

        emit(
          state.copyWith(
            itemsByCategory: updatedItemsByCategory,
            itemsApiResponse: ApiResponse.completed(
              updatedItemsByCategory[event.categoryId] ?? [],
            ),
          ),
        );
      } else {
        emit(
          state.copyWith(
            itemsApiResponse: ApiResponse.error(
              response?['error'] ?? 'Failed to update item',
            ),
          ),
        );
      }
    } catch (e) {
      emit(state.copyWith(itemsApiResponse: ApiResponse.error(e.toString())));
    }
  }

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
    } catch (e) {
      print('error: $e');
    }
  }
}
