import 'package:fast_food/modules/main/domain/entity/restourant_entity.dart';

class RestaurantModel extends RestaurantEntity {
  RestaurantModel({
    required super.id,
    required super.name,
    required super.description,
    required super.rating,
    required super.address,
    required super.image,
    required super.createdAt,
  });
  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      rating: json['rating'] ?? 0.0,
      address: json['address'] ?? '',
      image: json['image'] ?? '',
      createdAt: DateTime.tryParse(json['createdAt'] ?? '') ?? DateTime.now(),
    );
  }
}
