import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moobazir_user/features/auth/domain/respositories/auth_repository.dart';
import '../data/auth_repository_impl.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl();
});