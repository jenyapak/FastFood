import 'dart:developer';

import 'package:fast_food/core/base/base_state.dart';
import 'package:fast_food/modules/autherization/domain/usecase/sign_in_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthCubit extends Cubit<BaseState<bool>> {
  final SignInUsecase _signInUsecase;

  AuthCubit({required SignInUsecase signInUsecase})
    : _signInUsecase = signInUsecase,
      super(BaseState.init());

  Future<void> signIn(String username, String password) async {
    emit(BaseState.loading());
    try {
      final result = await _signInUsecase(
        SignInParams(username: username, password: password),
      );
      emit(BaseState.success(model: result));
      log(result.toString());
    } catch (e) {
      emit(BaseState.error(message: e.toString()));
    }
  }
}
