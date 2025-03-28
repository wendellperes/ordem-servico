
abstract class IRepository {
  Future<bool> validateUser({required String email, required String password});
}
