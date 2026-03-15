import 'package:fast_food/core/service/supabase_service.dart';
import 'package:fast_food/modules/autherization/domain/repository/auth_domain_repository.dart';
import 'package:fast_food/modules/autherization/domain/usecase/sign_up_usecase.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthDomainRepository)
class AuthRepository implements AuthDomainRepository {
  final SupabaseService _supabaseService;

  AuthRepository({required SupabaseService supabaseService})
    : _supabaseService = supabaseService;

  @override
  Future<bool> signIn(String username, String password) async {
    try {
      final response = await _supabaseService.client
          .from('users')
          .select()
          .eq('username', username)
          .eq('password', password)
          .maybeSingle();
      if (response?.isEmpty ?? false || response == null) {
        return false;
      } else {
        return true;
      }
    } catch (e) {
      throw Exception('Ошибка: $e');
    }
  }

  @override
  Future<bool> signUp(SignUpParams params) async {
    try {
      final response = await _supabaseService.client.from('users').insert([
        params.toJson(),
      ]);
      if (response == null) {
        return false;
      }
      return true;
    } catch (e) {
      throw Exception('Ошибка: $e');
    }
  }
}
