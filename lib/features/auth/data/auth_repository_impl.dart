import 'package:moobazir_user/features/auth/domain/entities/user_entity.dart';
import 'package:moobazir_user/features/auth/domain/respositories/auth_repository.dart';


class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<UserEntity> login(String email, String password) async {
    // Mock implementation for demo
    await Future.delayed(const Duration(seconds: 1));
    
    if (email.isNotEmpty && password.isNotEmpty) {
      return UserEntity(
        id: '1',
        email: email,
        name: 'Demo Seller',
        role: 'seller',
      );
    } else {
      throw Exception('Login failed');
    }
  }

  @override
  Future<UserEntity> registerSeller(String storeName, String email, String password) async {
    // Mock implementation for demo
    await Future.delayed(const Duration(seconds: 1));
    
    return UserEntity(
      id: '1',
      email: email,
      name: storeName,
      role: 'seller',
    );
  }

  @override
  Future<void> logout() async {
    await Future.delayed(const Duration(milliseconds: 500));
  }

  @override
  Future<bool> isLoggedIn() async {
    return false; // Always false for demo
  }
}