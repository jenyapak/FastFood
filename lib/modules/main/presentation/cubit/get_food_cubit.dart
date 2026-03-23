import 'package:fast_food/core/base/base_state.dart';
import 'package:fast_food/modules/main/domain/entity/food_entity.dart';
import 'package:fast_food/modules/main/domain/usecase/get_foods_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetFoodCubit extends Cubit<BaseState<List<FoodEntity>>> {
  final GetFoodsUsecase _getFoodsUsecase;

  GetFoodCubit({required GetFoodsUsecase getFoodsUsecase})
    : _getFoodsUsecase = getFoodsUsecase,
      super(BaseState.init());

  Future<void> getFoods(String restaurantId) async {
    emit(BaseState.loading());
    try {
      final result = await _getFoodsUsecase.call(
        GetFoodParams(restaurantId: restaurantId),
      );
      emit(BaseState.success(model: result));
    } catch (e) {
      emit(BaseState.error(message: e.toString()));
    }
  }
}
