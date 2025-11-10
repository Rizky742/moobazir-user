class AuthApi {
  Future<Map<String, dynamic>> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    if (email == 'test@moobazir.com' && password == '1234567') {
      return {"id": "1", "name": "Rizky", "email": email};
    } else {
      throw Exception("Invalid credentials");
    }
  }
}
