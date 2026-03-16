import 'package:fast_food/modules/main/domain/entity/food_entity.dart';

class FoodModel extends FoodEntity {
  FoodModel({
    required super.id,
    required super.name,
    required super.cuisines,
    required super.rating,
    required super.price,
    required super.calories,
    required super.discription,
    required super.isRescued,
    required super.discount,
    required super.cookingDuration,
    required super.image,
  });
  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      cuisines: (json['cuisines'] as Map).entries
          .map((e) => e.value.toString())
          .toList(),
      rating: json['rating'] ?? 0.0,
      price: json['price'] ?? 0,
      calories: json['calories'] ?? 0,
      discription: json['discription'] ?? '',
      isRescued: json['isRescued'] ?? false,
      discount: json['discount'] ?? 0,
      cookingDuration: json['cookingDuration'] ?? 0,
      image: json['image'] ?? '',
    );
  }
}
