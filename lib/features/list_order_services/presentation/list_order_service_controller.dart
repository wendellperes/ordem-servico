import 'package:desafio_os/features/register_order_services/data/repositories/repository_interface.dart';
import 'package:flutter/material.dart';

class CreateOrderServiceController {
  CreateOrderServiceController({
    required IOrderServiceRepository repository,
  }) : _repository = repository;

  final IOrderServiceRepository _repository;
  String title = '';
  String description = '';
  String selectedChecklistOption = '';

  // ValueNotifiers para validação dos campos
  final titleError = ValueNotifier<String?>(null);
  final descriptionError = ValueNotifier<String?>(null);
  final checklistError = ValueNotifier<String?>(null);
  final imagePath = ValueNotifier<String>('');

  void registerOrderService() async {
    if (!validateFields()) {
      return;
    }
   final result = await _repository.saveOrderService(
      title: title,
      description: description,
      checklistOption: selectedChecklistOption,
      photoPath: imagePath.value,
    );
    if (result) {
      // Sucesso no registro
      title = '';
      description = '';
      selectedChecklistOption = '';
      imagePath.value = '';
      return;
    }
  }

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