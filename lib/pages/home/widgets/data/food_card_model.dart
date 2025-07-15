class FoodCardModel {
  final String imagePath;
  final String title;
  final double rating;
  final int reviewsCount;
  final String duration;
  final String priceLevel;
  final String cuisine;
  final int deliveryFee;
  final String discountLabel;
  final bool isAd;
  final double distance;
  final bool acceptsVoucher;

  final String dishName;
  final String servingInfo;
  final int price;
  final int discountPercent;

  FoodCardModel({
    required this.imagePath,
    required this.title,
    required this.rating,
    required this.reviewsCount,
    required this.duration,
    required this.priceLevel,
    required this.cuisine,
    required this.deliveryFee,
    required this.discountLabel,
    required this.isAd,
    required this.distance,
    required this.acceptsVoucher,
    required this.dishName,
    required this.servingInfo,
    required this.price,
    required this.discountPercent,
  });

  double get newPrice => price * (1 - discountPercent / 100);
  int get oldPrice => price;

  String get deliveryTime => duration;

  factory FoodCardModel.fromJson(Map<String, dynamic> json) {
    return FoodCardModel(
      imagePath: json['imagePath'],
      title: json['title'],
      rating: (json['rating'] as num).toDouble(),
      reviewsCount: json['reviewsCount'] ?? 0,
      duration: json['duration'] ?? '',
      priceLevel: json['priceLevel'] ?? '',
      cuisine: json['cuisine'] ?? '',
      deliveryFee: json['deliveryFee'] ?? 0,
      discountLabel: json['discountLabel'] ?? '',
      isAd: json['isAd'] ?? false,
      distance: (json['distance'] as num).toDouble(),
      acceptsVoucher: json['acceptsVoucher'] ?? false,
      dishName: json['dishName'] ?? '',
      servingInfo: json['servingInfo'] ?? '',
      price: json['Price'], // watch capital P
      discountPercent: json['discountPercent'],
    );
  }
}
