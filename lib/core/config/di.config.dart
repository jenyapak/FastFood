// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../modules/autherization/data/repository/auth_repository.dart'
    as _i877;
import '../../modules/autherization/domain/repository/auth_domain_repository.dart'
    as _i917;
import '../../modules/autherization/domain/usecase/sign_in_usecase.dart'
    as _i602;
import '../../modules/autherization/domain/usecase/sign_up_usecase.dart'
    as _i106;
import '../../modules/autherization/presentation/auth_cubit.dart' as _i809;
import '../../modules/main/data/repository/food_repository.dart' as _i908;
import '../../modules/main/domain/repository/food_domain_repository.dart'
    as _i873;
import '../../modules/main/domain/usecase/get_foods_usecase.dart' as _i384;
import '../../modules/main/presentation/cubit/get_food_cubit.dart' as _i1009;
import '../service/supabase_service.dart' as _i246;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i246.SupabaseService>(() => _i246.SupabaseService());
    gh.lazySingleton<_i917.AuthDomainRepository>(
      () => _i877.AuthRepository(supabaseService: gh<_i246.SupabaseService>()),
    );
    gh.factory<_i602.SignInUsecase>(
      () => _i602.SignInUsecase(repository: gh<_i917.AuthDomainRepository>()),
    );
    gh.factory<_i106.SignUpUsecase>(
      () => _i106.SignUpUsecase(repository: gh<_i917.AuthDomainRepository>()),
    );
    gh.lazySingleton<_i873.FoodDomainRepository>(
      () => _i908.FoodRepository(client: gh<_i246.SupabaseService>()),
    );
    gh.factory<_i384.GetFoodsUsecase>(
      () => _i384.GetFoodsUsecase(repository: gh<_i873.FoodDomainRepository>()),
    );
    gh.factory<_i1009.GetFoodCubit>(
      () => _i1009.GetFoodCubit(getFoodsUsecase: gh<_i384.GetFoodsUsecase>()),
    );
    gh.factory<_i809.AuthCubit>(
      () => _i809.AuthCubit(
        signInUsecase: gh<_i602.SignInUsecase>(),
        signUpUsecase: gh<_i106.SignUpUsecase>(),
      ),
    );
    return this;
  }
}
