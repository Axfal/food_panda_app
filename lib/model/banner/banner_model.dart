import 'package:equatable/equatable.dart';

class BannerModel extends Equatable {
  final bool? success;
  final int? count;
  final List<Banners>? banners;

  const BannerModel({
    this.success,
    this.count,
    this.banners,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      success: json['success'] as bool?,
      count: json['count'] as int?,
      banners: (json['banners'] as List<dynamic>?)
          ?.map((e) => Banners.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'count': count,
      'banners': banners?.map((e) => e.toJson()).toList(),
    };
  }

  BannerModel copyWith({
    bool? success,
    int? count,
    List<Banners>? banners,
  }) {
    return BannerModel(
      success: success ?? this.success,
      count: count ?? this.count,
      banners: banners ?? this.banners,
    );
  }

  @override
  List<Object?> get props => [success, count, banners];
}

class Banners extends Equatable {
  final int? id;
  final String? title;
  final String? image;
  final String? createdAt;
  final String? imageUrl;

  const Banners({
    this.id,
    this.title,
    this.image,
    this.createdAt,
    this.imageUrl,
  });

  factory Banners.fromJson(Map<String, dynamic> json) {
    return Banners(
      id: json['id'] as int?,
      title: json['title'] as String?,
      image: json['image'] as String?,
      createdAt: json['created_at'] as String?,
      imageUrl: json['image_url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'created_at': createdAt,
      'image_url': imageUrl,
    };
  }

  Banners copyWith({
    int? id,
    String? title,
    String? image,
    String? createdAt,
    String? imageUrl,
  }) {
    return Banners(
      id: id ?? this.id,
      title: title ?? this.title,
      image: image ?? this.image,
      createdAt: createdAt ?? this.createdAt,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  @override
  List<Object?> get props => [id, title, image, createdAt, imageUrl];
}
