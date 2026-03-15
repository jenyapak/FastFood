import 'package:fast_food/modules/autherization/main/domain/entity/food_entity.dart';

class FoodModel extends FoodEntity {
  FoodModel({
    required super.name,
    required super.cuisines,
    required super.rating,
    required super.price,
    required super.calories,
    required super.discription,
    required super.isRescued,
    required super.discount,
    required super.cookingDuration,
  });
  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(
      name: json['name'] ?? '',
      cuisines: json['cuisines'] ?? [],
      rating: json['rating'] ?? 0.0,
      price: json['price'] ?? 0.0,
      calories: json['calories'] ?? 0,
      discription: json['discription'] ?? '',
      isRescued: json['isRescued'] ?? false,
      discount: json['discount'] ?? 0.0,
      cookingDuration: json['cookingDuration'] ?? 0,
    );
  }
}
