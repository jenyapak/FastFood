import 'package:fast_food/core/base/base_usecase.dart';
import 'package:fast_food/modules/main/domain/entity/food_entity.dart';
import 'package:fast_food/modules/main/domain/repository/food_domain_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetFoodsUsecase extends BaseUsecase<List<FoodEntity>, GetFoodParams> {
  final FoodDomainRepository _repository;

  GetFoodsUsecase({required FoodDomainRepository repository})
    : _repository = repository;
  @override
  Future<List<FoodEntity>> call(GetFoodParams params) {
    return _repository.getFoods(params);
  }
}

class GetFoodParams extends BaseParams {
  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}
