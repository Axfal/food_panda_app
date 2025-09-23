class TopRestaurantModel {
  final bool? success;
  final UserLocation? userLocation;
  final int? radiusKm;
  final List<Restaurant>? restaurants;

  const TopRestaurantModel({
    this.success,
    this.userLocation,
    this.radiusKm,
    this.restaurants,
  });

  factory TopRestaurantModel.fromJson(Map<String, dynamic> json) {
    return TopRestaurantModel(
      success: json['success'] as bool?,
      userLocation: json['user_location'] != null
          ? UserLocation.fromJson(json['user_location'])
          : null,
      radiusKm: json['radius_km'] as int?,
      restaurants: (json['restaurants'] as List<dynamic>?)
          ?.map((v) => Restaurant.fromJson(v as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'user_location': userLocation?.toJson(),
      'radius_km': radiusKm,
      'restaurants': restaurants?.map((v) => v.toJson()).toList(),
    };
  }
}

class UserLocation {
  final double? lat;
  final double? lng;

  const UserLocation({this.lat, this.lng});

  factory UserLocation.fromJson(Map<String, dynamic> json) {
    return UserLocation(
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lat': lat,
      'lng': lng,
    };
  }
}

class Restaurant {
  final int? id;
  final String? name;
  final String? description;
  final String? logo;
  final String? lat;
  final String? lng;
  final String? avgRating;
  final int? totalReviews;
  final double? distance;

  const Restaurant({
    this.id,
    this.name,
    this.description,
    this.logo,
    this.lat,
    this.lng,
    this.avgRating,
    this.totalReviews,
    this.distance,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      logo: json['logo'] as String?,
      lat: json['lat'] as String?,
      lng: json['lng'] as String?,
      avgRating: json['avg_rating'] as String?,
      totalReviews: json['total_reviews'] as int?,
      distance: (json['distance'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'logo': logo,
      'lat': lat,
      'lng': lng,
      'avg_rating': avgRating,
      'total_reviews': totalReviews,
      'distance': distance,
    };
  }
}
