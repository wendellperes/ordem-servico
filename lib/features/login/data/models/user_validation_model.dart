class UserValidationModel {
  final String email;
  final String password;

  UserValidationModel({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }

  factory UserValidationModel.fromJson(Map<String, dynamic> json) {
    try {
      return UserValidationModel(
        email: json['email'] as String,
        password: json['password'] as String,
      );
    } catch (e) {
      throw Exception('Error parsing UserValidationModel: $e');
    }
  }
}