class CartItemModel {
  final String id;
  final String name;
  final double price;
  final int quantity;
  final String imageUrl;

  CartItemModel({
    required this.id,
    required this.name,
    required this.price,
    this.quantity = 1,
    this.imageUrl = '',
  });

  CartItemModel copyWith({
    String? id,
    String? name,
    double? price,
    int? quantity,
    String? imageUrl,
  }) {
    return CartItemModel(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'quantity': quantity,
      'imageUrl': imageUrl,
    };
  }

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      id: json['id'],
      name: json['name'],
      price: (json['price'] as num).toDouble(),
      quantity: json['quantity'],
      imageUrl: json['imageUrl'] ?? '',
    );
  }
}
