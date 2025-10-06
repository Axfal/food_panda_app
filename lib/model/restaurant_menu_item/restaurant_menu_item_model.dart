class RestaurantMenuItemModel {
  final bool? success;
  final int? count;
  final List<Items>? items;

  RestaurantMenuItemModel({this.success, this.count, this.items});

  factory RestaurantMenuItemModel.fromJson(Map<String, dynamic> json) {
    return RestaurantMenuItemModel(
      success: json['success'],
      count: json['count'],
      items: json['items'] != null
          ? (json['items'] as List).map((e) => Items.fromJson(e)).toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'count': count,
      'items': items?.map((e) => e.toJson()).toList(),
    };
  }
}

class Items {
  final int? id;
  final int? restaurantId;
  final int? categoryId;
  final String? name;
  final String? description;
  final String? price; // can be null or string
  final String? photo;
  final String? status;
  final List<Variations>? variations;

  Items({
    this.id,
    this.restaurantId,
    this.categoryId,
    this.name,
    this.description,
    this.price,
    this.photo,
    this.status,
    this.variations,
  });

  factory Items.fromJson(Map<String, dynamic> json) {
    return Items(
      id: json['id'],
      restaurantId: json['restaurant_id'],
      categoryId: json['category_id'],
      name: json['name'],
      description: json['description'],
      price: json['price'], // API sometimes returns null
      photo: json['photo'],
      status: json['status'],
      variations: json['variations'] != null
          ? (json['variations'] as List)
          .map((e) => Variations.fromJson(e))
          .toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'restaurant_id': restaurantId,
      'category_id': categoryId,
      'name': name,
      'description': description,
      'price': price,
      'photo': photo,
      'status': status,
      'variations': variations?.map((e) => e.toJson()).toList(),
    };
  }
}

class Variations {
  final int? id;
  final String? name;
  final String? price;

  Variations({this.id, this.name, this.price});

  factory Variations.fromJson(Map<String, dynamic> json) {
    return Variations(
      id: json['id'],
      name: json['name'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
    };
  }
}
