part of 'menu_management_bloc.dart';

sealed class MenuManagementEvent extends Equatable {
  const MenuManagementEvent();

  @override
  List<Object?> get props => [];
}

/// ---------- ITEM EVENTS ----------

class FetchItemsEvent extends MenuManagementEvent {
  final String restaurantId;
  final String categoryId;
  const FetchItemsEvent({
    required this.restaurantId,
    required this.categoryId,
  });

  @override
  List<Object> get props => [restaurantId, categoryId];
}

class AddItemEvent extends MenuManagementEvent {
  final String restaurantId;
  final String categoryId;
  final String name;
  final String description;
  final String price;
  final String status;
  final File? photo;
  final List<Variation> variations;

  const AddItemEvent({
    required this.name,
    required this.restaurantId,
    required this.price,
    this.photo,
    required this.status,
    required this.description,
    required this.categoryId,
    required this.variations,
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
    variations
  ];
}

class UpdateItemEvent extends MenuManagementEvent {
  final String restaurantId;
  final String categoryId;
  final String name;
  final String description;
  final String price;
  final String status;
  final File? photo;
  final String itemId;
  final List<Variation> variations;

  const UpdateItemEvent({
    required this.name,
    required this.restaurantId,
    required this.itemId,
    required this.price,
    this.photo,
    required this.status,
    required this.description,
    required this.categoryId,
    required this.variations,
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
    variations
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
  final String? restaurantId;
  const FetchCategoriesEvent({this.restaurantId});
}

class AddCategoryEvent extends MenuManagementEvent {
  final String restaurantId;
  final String categoryName;
  final File image;
  const AddCategoryEvent({
    required this.restaurantId,
    required this.categoryName,
    required this.image,
  });

  @override
  List<Object?> get props => [restaurantId, image, categoryName];
}

class UpdateCategoryEvent extends MenuManagementEvent {
  final String categoryId;
  final String restaurantId;
  final String? name;
  final File? photo;

  const UpdateCategoryEvent({
    required this.restaurantId,
    required this.categoryId,
    this.name,
    this.photo,
  });

  @override
  List<Object?> get props => [categoryId, name, restaurantId, photo];
}

class DeleteCategoryEvent extends MenuManagementEvent {
  final String categoryId;
  final String restaurantId;

  const DeleteCategoryEvent({
    required this.restaurantId,
    required this.categoryId,
  });

  @override
  List<Object?> get props => [categoryId, restaurantId];
}
