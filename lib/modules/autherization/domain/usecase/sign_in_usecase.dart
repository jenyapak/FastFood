import 'package:fast_food/core/base/base_usecase.dart';
import 'package:fast_food/modules/autherization/domain/repository/auth_domain_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignInUsecase extends BaseUsecase<bool, SignInParams> {
  final AuthDomainRepository _repository;

  SignInUsecase({required AuthDomainRepository repository})
    : _repository = repository;
  @override
  Future<bool> call(SignInParams params) {
    return _repository.signIn(params.username, params.password);
  }
}

final class SignInParams extends BaseParams {
  final String username;
  final String password;

  SignInParams({required this.username, required this.password});

  @override
  Map<String, dynamic> toJson() {
    return {'username': username, 'password': password};
  }
}
