import 'package:desafio_os/features/home/presentation/home/home_controller.dart';
import 'package:desafio_os/features/register_order_services/route.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:desafio_os/features/login/presentation/router.dart';

class HomePage extends StatefulWidget {
    const HomePage({
    required this.controller,
    super.key,
  });

  final HomeController controller;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final controller = widget.controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF2b4bfe),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Botão "Ver Minhas Vendas"
            ElevatedButton(
              onPressed: () {
                // Ação ao clicar no botão "Ver Minhas Vendas"
                // context.push( LoginRoutes.listProduct);
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text(
                'Ver Minhas Ordem de Serviço',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            const SizedBox(height: 16.0),

            // Botão "Cadastrar Ordem de Serviço"
            ElevatedButton(
              onPressed: () {
               
                context.push(OrderServiceRoutes.createOrderServiceRoute);
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text(
                'Cadastrar Ordem de Serviço',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Ação ao clicar no botão "Estatísticas"
                context.go(LoginRoutes.loginRoute);
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text(
                'Sair',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}