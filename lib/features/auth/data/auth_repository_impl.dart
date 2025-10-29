import 'package:moobazir_user/features/auth/data/auth_api.dart';
import 'package:moobazir_user/features/auth/data/auth_model.dart';
import 'package:moobazir_user/features/auth/domain/entities/user_entity.dart';
import 'package:moobazir_user/features/auth/domain/respositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApi api;
  AuthRepositoryImpl(this.api);
  @override
  Future<UserEntity> login(String email, String password) async {
    final data = await api.login(email, password);
    return UserModel.fromJson(data);
  }
}
