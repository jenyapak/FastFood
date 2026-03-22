import 'package:fast_food/core/service/supabase_service.dart';
import 'package:fast_food/modules/main/data/model/food_model.dart';
import 'package:fast_food/modules/main/data/model/restaurant_model.dart';
import 'package:fast_food/modules/main/domain/repository/food_domain_repository.dart';
import 'package:fast_food/modules/main/domain/usecase/get_foods_usecase.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: FoodDomainRepository)
class FoodRepository implements FoodDomainRepository {
  final SupabaseService _client;

  FoodRepository({required SupabaseService client}) : _client = client;
  @override
  Future<List<FoodModel>> getFoods(GetFoodParams params) async {
    try {
      final response = await _client.client.from('foods').select();
      return response.map((e) => FoodModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Error ${e.toString()}');
    }
  }

  @override
  Future<List<RestaurantModel>> getRestaurants() async {
    try {
      final response = await _client.client.from('restaurants').select();
      return response.map((e) => RestaurantModel.fromJson(e)).toList();
    } catch (e) {
      throw Exception('Error ${e.toString()}');
    }
  }
}
