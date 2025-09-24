class GetProductReviewModel {
  bool? success;
  int? restaurantId;
  int? menuItemId;
  int? averageRating;
  int? totalReviews;
  List<Reviews>? reviews;

  GetProductReviewModel({
    this.success,
    this.restaurantId,
    this.menuItemId,
    this.averageRating,
    this.totalReviews,
    this.reviews,
  });

  factory GetProductReviewModel.fromJson(Map<String, dynamic> json) {
    return GetProductReviewModel(
      success: json['success'],
      restaurantId: json['restaurant_id'],
      menuItemId: json['menu_item_id'],
      averageRating: json['average_rating'],
      totalReviews: json['total_reviews'],
      reviews: json['reviews'] != null
          ? (json['reviews'] as List)
          .map((v) => Reviews.fromJson(v))
          .toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'restaurant_id': restaurantId,
      'menu_item_id': menuItemId,
      'average_rating': averageRating,
      'total_reviews': totalReviews,
      'reviews': reviews?.map((v) => v.toJson()).toList(),
    };
  }
}

class Reviews {
  int? id;
  int? userId;
  int? rating;
  String? reviewText;
  String? createdAt;
  String? userName;

  Reviews({
    this.id,
    this.userId,
    this.rating,
    this.reviewText,
    this.createdAt,
    this.userName,
  });

  factory Reviews.fromJson(Map<String, dynamic> json) {
    return Reviews(
      id: json['id'],
      userId: json['user_id'],
      rating: json['rating'],
      reviewText: json['review_text'],
      createdAt: json['created_at'],
      userName: json['user_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'rating': rating,
      'review_text': reviewText,
      'created_at': createdAt,
      'user_name': userName,
    };
  }
}
