import 'package:fast_food/core/base/base_usecase.dart';
import 'package:fast_food/modules/main/domain/entity/restourant_entity.dart';
import 'package:fast_food/modules/main/domain/repository/food_domain_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetRestorauntsUsecase
    extends BaseUsecase<List<RestaurantEntity>, GetRestorauntsParams> {
  final FoodDomainRepository _repository;

  GetRestorauntsUsecase({required FoodDomainRepository repository})
    : _repository = repository;

  @override
  Future<List<RestaurantEntity>> call(GetRestorauntsParams params) {
    return _repository.getRestaurants();
  }
}

final class GetRestorauntsParams extends BaseParams {
  GetRestorauntsParams();

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}
