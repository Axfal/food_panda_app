class CartItemModel {
  final String id;
  final String name;
  final double price;
  final int quantity;
  final String imageUrl;
  final String restaurantId;
  final int? variationId;

  CartItemModel({
    this.variationId,
    required this.id,
    required this.name,
    required this.price,
    this.quantity = 1,
    this.imageUrl = '',
    required this.restaurantId,
  });

  CartItemModel copyWith({
    String? id,
    int? variationId,
    String? name,
    double? price,
    int? quantity,
    String? imageUrl,
    String? restaurantId,
  }) {
    return CartItemModel(
      id: id ?? this.id,
      variationId: variationId ?? this.variationId,
      name: name ?? this.name,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      imageUrl: imageUrl ?? this.imageUrl,
      restaurantId: restaurantId ?? this.restaurantId,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'variation_id': variationId,
      'quantity': quantity,
      'imageUrl': imageUrl,
      'restaurantId': restaurantId,
    };
  }

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      id: json['id'],
      name: json['name'],
      variationId: json['variation_id'],
      price: (json['price'] as num).toDouble(),
      quantity: json['quantity'],
      imageUrl: json['imageUrl'] ?? '',
      restaurantId: json['restaurantId'],
    );
  }
}
