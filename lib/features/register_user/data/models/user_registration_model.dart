class UserRegistrationModel {
  final String name;
  final String email;
  final String password;
  final String matricula;

  UserRegistrationModel({
    required this.name,
    required this.email,
    required this.password,
    required this.matricula,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'matricula': matricula,
    };
  }

  factory UserRegistrationModel.fromJson(Map<String, dynamic> json) {
    try {
      return UserRegistrationModel(
        name: json['name'] as String,
        email: json['email'] as String,
        password: json['password'] as String,
        matricula: json['matricula'] as String,
      );
    } catch (e) {
      throw Exception('Error parsing UserRegistrationModel: $e');
    }
  }
}