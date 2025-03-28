import 'package:flutter/material.dart';

class CreateOrderServiceController {
  String title = '';
  String description = '';
  String selectedChecklistOption = '';

  // ValueNotifiers para validação dos campos
  final titleError = ValueNotifier<String?>(null);
  final descriptionError = ValueNotifier<String?>(null);
  final checklistError = ValueNotifier<String?>(null);
  final imagePath = ValueNotifier<String>('');

  // Validações dos campos
  bool validateFields() {
    bool isValid = true;

    if (title.isEmpty) {
      titleError.value = 'O título é obrigatório.';
      isValid = false;
    } else {
      titleError.value = null;
    }

    if (description.isEmpty) {
      descriptionError.value = 'A descrição é obrigatória.';
      isValid = false;
    } else {
      descriptionError.value = null;
    }

    if (selectedChecklistOption.isEmpty) {
      checklistError.value = 'Selecione uma opção.';
      isValid = false;
    } else {
      checklistError.value = null;
    }

    return isValid;
  }

  void dispose() {
    titleError.dispose();
    descriptionError.dispose();
    checklistError.dispose();
  }
}