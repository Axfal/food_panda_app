class RecommendedItemModel {
  final bool? success;
  final List<Recommendation>? recommendations;

  const RecommendedItemModel({
    this.success,
    this.recommendations,
  });

  factory RecommendedItemModel.fromJson(Map<String, dynamic> json) {
    return RecommendedItemModel(
      success: json['success'] as bool?,
      recommendations: (json['recommendations'] as List<dynamic>?)
          ?.map((v) => Recommendation.fromJson(v as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'recommendations': recommendations?.map((v) => v.toJson()).toList(),
    };
  }
}

class Recommendation {
  final int? id;
  final String? name;
  final int? categoryId;
  final String? price;
  final String? photo;

  const Recommendation({
    this.id,
    this.name,
    this.categoryId,
    this.price,
    this.photo,
  });

  factory Recommendation.fromJson(Map<String, dynamic> json) {
    return Recommendation(
      id: json['id'] as int?,
      name: json['name'] as String?,
      categoryId: json['category_id'] as int?,
      price: json['price'] as String?,
      photo: json['photo'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category_id': categoryId,
      'price': price,
      'photo': photo,
    };
  }
}
