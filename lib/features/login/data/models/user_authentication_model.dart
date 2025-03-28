class UserAuthenticationModel {
  final String email;
  final String password;

  UserAuthenticationModel({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }

  factory UserAuthenticationModel.fromJson(Map<String, dynamic> json) {
    try {
      return UserAuthenticationModel(
        email: json['email'] as String,
        password: json['password'] as String,
      );
    } catch (e) {
      throw Exception('Error parsing UserAuthenticationModel: $e');
    }
  }
}