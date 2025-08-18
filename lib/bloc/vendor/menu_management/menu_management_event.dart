part of 'menu_management_bloc.dart';

sealed class MenuManagementEvent extends Equatable {
  const MenuManagementEvent();

  @override
  List<Object?> get props => [];
}

/// ---------- ITEM EVENTS ----------

class FetchItemsEvent extends MenuManagementEvent {
  final bool refreshItem;
  final String restaurantId;
  final String categoryId;
  const FetchItemsEvent({required this.restaurantId, required this.categoryId, required this.refreshItem});

  @override
  List<Object> get props => [restaurantId, categoryId, refreshItem];
}

class AddItemEvent extends MenuManagementEvent {
  final String restaurantId;
  final String categoryId;
  final String name;
  final String description;
  final String price;
  final String status;
  final File photo;

  const AddItemEvent({
    required this.name,
    required this.restaurantId,
    required this.price,
    required this.photo,
    required this.status,
    required this.description,
    required this.categoryId,
  });

  @override
  List<Object?> get props => [
    name,
    price,
    description,
    categoryId,
    status,
    restaurantId,
    photo,
  ];
}

class UpdateItemEvent extends MenuManagementEvent {
  final String restaurantId;
  final String categoryId;
  final String name;
  final String description;
  final String price;
  final String status;
  final File photo;
  final String itemId;

  const UpdateItemEvent({
    required this.name,
    required this.restaurantId,
    required this.itemId,
    required this.price,
    required this.photo,
    required this.status,
    required this.description,
    required this.categoryId,
  });

  @override
  List<Object?> get props => [
    name,
    restaurantId,
    status,
    price,
    itemId,
    description,
    categoryId,
    photo,
  ];
}

class DeleteItemEvent extends MenuManagementEvent {
  final String itemId;
  final String restaurantId;
  final String categoryId;

  const DeleteItemEvent(this.categoryId, this.itemId, this.restaurantId);

  @override
  List<Object?> get props => [itemId, restaurantId, categoryId];
}

/// ---------- CATEGORY EVENTS ----------

class FetchCategoriesEvent extends MenuManagementEvent {
  final String restaurantId;
  const FetchCategoriesEvent({required this.restaurantId});
}

class AddCategoryEvent extends MenuManagementEvent {
  final String name;

  const AddCategoryEvent(this.name);

  @override
  List<Object?> get props => [name];
}

class UpdateCategoryEvent extends MenuManagementEvent {
  final String categoryId;
  final String name;

  const UpdateCategoryEvent({required this.categoryId, required this.name});

  @override
  List<Object?> get props => [categoryId, name];
}

class DeleteCategoryEvent extends MenuManagementEvent {
  final String categoryId;

  const DeleteCategoryEvent(this.categoryId);

  @override
  List<Object?> get props => [categoryId];
}
