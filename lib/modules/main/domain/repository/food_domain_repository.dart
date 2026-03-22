import 'package:fast_food/modules/main/domain/entity/food_entity.dart';
import 'package:fast_food/modules/main/domain/entity/restourant_entity.dart';
import 'package:fast_food/modules/main/domain/usecase/get_foods_usecase.dart';

abstract class FoodDomainRepository {
  Future<List<FoodEntity>> getFoods(GetFoodParams params);
  Future<List<RestaurantEntity>> getRestaurants();
}
