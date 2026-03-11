abstract class AuthDomainRepository {
  Future<bool> signIn(String username, String password);
}
