import 'package:fast_food/core/base/base_state.dart';
import 'package:fast_food/modules/main/domain/entity/restourant_entity.dart';
import 'package:fast_food/modules/main/domain/usecase/get_restaraunts_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetRestaurantsCubit extends Cubit<BaseState<List<RestaurantEntity>>> {
  final GetRestorauntsUsecase _getRestorauntsUsecase;

  GetRestaurantsCubit({required GetRestorauntsUsecase getRestorauntsUsecase})
    : _getRestorauntsUsecase = getRestorauntsUsecase,
      super(BaseState.init());

  Future<void> getRestaurants() async {
    emit(BaseState.loading());
    try {
      final result = await _getRestorauntsUsecase.call(GetRestorauntsParams());
      emit(BaseState.success(model: result));
    } catch (e) {
      emit(BaseState.error(message: e.toString()));
    }
  }
}
