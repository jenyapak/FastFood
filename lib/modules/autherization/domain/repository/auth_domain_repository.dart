import 'package:fast_food/modules/autherization/domain/usecase/sign_up_usecase.dart';

abstract class AuthDomainRepository {
  Future<bool> signIn(String username, String password);

  Future<bool> signUp(SignUpParams params);
}
