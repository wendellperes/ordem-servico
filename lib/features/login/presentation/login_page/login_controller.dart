import 'package:flutter/material.dart';
import 'package:desafio_os/features/login/data/repositories/repository_interface.dart';

enum PageState {
  idle,
  success,
  error,
}

class LoginController {
  LoginController({
    required IRepository repository,
  }) : _repository = repository;

  final IRepository _repository;

  final state = ValueNotifier<PageState>(PageState.idle);

  String email = '';
  String password = '';

  Future<void> getUser() async {
    try {
      state.value = PageState.idle; // Reset state to idle before starting
      final result = await _repository.validateUser(
        email: email,
        password: password,
      );
      if (result) {
        state.value =
            PageState.success; // Set state to success if no exception occurs
        return;
      }
      state.value =
            PageState.error;
    } catch (e) {
      state.value = PageState.error; // Error state in case of exception
    }
  }

  void dispose() {
    state.dispose();
  }
}
