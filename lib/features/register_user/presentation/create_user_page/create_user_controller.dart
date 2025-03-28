import 'package:desafio_os/features/register_user/data/repositories/register_repository_interface.dart';
import 'package:desafio_os/features/register_user/data/models/user_registration_model.dart';
import 'package:flutter/material.dart';


class CreateUserController {
  final IRegisterRepository repository;

  CreateUserController({required this.repository});

  String name = '';
  String email = '';
  String password = '';
  String matricula = '';

  // ValueNotifiers para validação dos campos
  final nameError = ValueNotifier<String?>(null);
  final emailError = ValueNotifier<String?>(null);
  final passwordError = ValueNotifier<String?>(null);
  final matriculaError = ValueNotifier<String?>(null);

  // Validações dos campos
  bool validateFields() {
    bool isValid = true;

    if (name.isEmpty) {
      nameError.value = 'O nome é obrigatório.';
      isValid = false;
    } else {
      nameError.value = null;
    }

    if (email.isEmpty || !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
      emailError.value = 'Insira um email válido.';
      isValid = false;
    } else {
      emailError.value = null;
    }

    if (password.isEmpty || password.length < 6) {
      passwordError.value = 'A senha deve ter pelo menos 6 caracteres.';
      isValid = false;
    } else {
      passwordError.value = null;
    }

    if (matricula.isEmpty || !RegExp(r'^\d{6}$').hasMatch(matricula)) {
      matriculaError.value = 'Insira um matricula válido (14 dígitos).';
      isValid = false;
    } else {
      matriculaError.value = null;
    }

    return isValid;
  }

  Future<bool> registerUser() async {
    if (!validateFields()) {
      return false;
    }

    try {
      final supplier = UserRegistrationModel(
        name: name,
        email: email,
        password: password,
        matricula: matricula,
      );
      await repository.registerUser(supplier);
      return true;
    } catch (e) {
      print('Erro ao cadastrar usuário: $e');
      return false;
    }
  }

  void dispose() {
    nameError.dispose();
    emailError.dispose();
    passwordError.dispose();
    matriculaError.dispose();
  }
}