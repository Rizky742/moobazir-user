import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moobazir_user/features/auth/data/auth_api.dart';
import 'package:moobazir_user/features/auth/data/auth_repository_impl.dart';
import 'package:moobazir_user/features/auth/domain/usecases/login_usecase.dart';

final authApiProvider = Provider((ref) => AuthApi());
final authRepositoryProvider = Provider(
  (ref) => AuthRepositoryImpl(ref.read(authApiProvider)),
);
final loginUseCaseProvider = Provider(
  (ref) => LoginUseCase(ref.read(authRepositoryProvider)),
);

class AuthState {
  final bool isLoading;
  final String? error;
  AuthState({this.isLoading = false, this.error});
}

class AuthNotifier extends StateNotifier<AuthState> {
  final LoginUseCase loginUseCase;

  AuthNotifier(this.loginUseCase) : super(AuthState());

  Future<void> login(String email, String password) async {
    state = AuthState(isLoading: true);
    try {
      final user = await loginUseCase.execute(email, password);
      // Di sini kamu bisa simpan user ke shared prefs / state global
      state = AuthState(isLoading: false);
      print('Welcome ${user.name}');
    } catch (e) {
      state = AuthState(isLoading: false, error: e.toString());
    }
  }
}


final authProvider =
    StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(ref.read(loginUseCaseProvider));
});