import 'package:fast_food/core/base/base_usecase.dart';
import 'package:fast_food/modules/autherization/domain/repository/auth_domain_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignUpUsecase extends BaseUsecase<bool, SignUpParams> {
  final AuthDomainRepository _repository;

  SignUpUsecase({required AuthDomainRepository repository})
    : _repository = repository;

  @override
  Future<bool> call(SignUpParams params) {
    return _repository.signUp(params);
  }
}

final class SignUpParams extends BaseParams {
  final String fullName;
  final DateTime createdAt;
  final String password;
  final String confirmPassword;

  SignUpParams({
    required this.fullName,
    required this.password,
    required this.confirmPassword,
    required this.createdAt,
  });

  @override
  Map<String, dynamic> toJson() {
    return {'username': fullName, 'password': password};
  }
}
