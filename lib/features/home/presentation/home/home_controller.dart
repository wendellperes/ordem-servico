import 'package:flutter/material.dart';
import 'package:desafio_os/features/login/data/repositories/repository_interface.dart';

enum PageState {
  idle,
  loading,
  success,
  error,
}

class HomeController {
  HomeController({
    required IRepository repository,
  }) : _repository = repository;

  final IRepository _repository;

  final state = ValueNotifier<PageState>(PageState.idle);

  Future<void> loadSales() async {
    try {
      state.value = PageState.loading; // Indica que o carregamento começou
      // Simulação de carregamento de vendas
      await Future.delayed(const Duration(seconds: 2));
      // Aqui você pode chamar o repositório para buscar as vendas
      print('Vendas carregadas com sucesso!');
      state.value = PageState.success; // Indica que o carregamento foi bem-sucedido
    } catch (e) {
      state.value = PageState.error; // Indica que ocorreu um erro
      print('Erro ao carregar vendas: $e');
    }
  }

  Future<void> loadStatistics() async {
    try {
      state.value = PageState.loading; // Indica que o carregamento começou
      // Simulação de carregamento de estatísticas
      await Future.delayed(const Duration(seconds: 2));
      // Aqui você pode chamar o repositório para buscar as estatísticas
      print('Estatísticas carregadas com sucesso!');
      state.value = PageState.success; // Indica que o carregamento foi bem-sucedido
    } catch (e) {
      state.value = PageState.error; // Indica que ocorreu um erro
      print('Erro ao carregar estatísticas: $e');
    }
  }

  void dispose() {
    state.dispose();
  }
}