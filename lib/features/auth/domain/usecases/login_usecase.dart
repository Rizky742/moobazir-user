import 'package:moobazir_user/features/auth/domain/entities/user_entity.dart';
import 'package:moobazir_user/features/auth/domain/respositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;
  LoginUseCase(this.repository);

  Future<UserEntity> execute(String email, String password) {
    return repository.login(email, password);
  }
}
