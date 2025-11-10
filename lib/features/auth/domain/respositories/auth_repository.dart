import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity> login(String email, String password);
  Future<UserEntity> registerSeller(String storeName, String email, String password);
  Future<void> logout();
  Future<bool> isLoggedIn();
}