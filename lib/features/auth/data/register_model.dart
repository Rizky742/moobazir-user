class RegisterModel {
  final String storeName;
  final String email;
  final String password;
  final String confirmPassword;
  final bool agreeToTerms;

  RegisterModel({
    required this.storeName,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.agreeToTerms,
  });

  RegisterModel copyWith({
    String? storeName,
    String? email,
    String? password,
    String? confirmPassword,
    bool? agreeToTerms,
  }) {
    return RegisterModel(
      storeName: storeName ?? this.storeName,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      agreeToTerms: agreeToTerms ?? this.agreeToTerms,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'storeName': storeName,
      'email': email,
      'password': password,
    };
  }
}