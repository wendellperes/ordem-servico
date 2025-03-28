import 'package:flutter/material.dart';
import 'package:desafio_os/features/register_user/presentation/create_user_page/create_user_controller.dart';

class CreateUserPage extends StatefulWidget {
  const CreateUserPage({
    required this.controller,
    super.key,
  });

  final CreateUserController controller;

  @override
  State<CreateUserPage> createState() => _CreateUserPageState();
}

class _CreateUserPageState extends State<CreateUserPage> {
  late final controller = widget.controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF2b4bfe),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Título
            const Text(
              'Cadastro de Usuário',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4059D7),
                fontFamily: 'Montserrat',
              ),
            ),
            const SizedBox(height: 60.0),
            // Campo de Nome
            ValueListenableBuilder<String?>(
              valueListenable: controller.nameError,
              builder: (context, error, child) {
                return TextField(
                  onChanged: (value) => controller.name = value,
                  decoration: InputDecoration(
                    labelText: 'Nome',
                    errorText: error,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    prefixIcon: const Icon(Icons.person),
                  ),
                );
              },
            ),
            const SizedBox(height: 16.0),

            // Campo de Email
            ValueListenableBuilder<String?>(
              valueListenable: controller.emailError,
              builder: (context, error, child) {
                return TextField(
                  onChanged: (value) => controller.email = value,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    errorText: error,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    prefixIcon: const Icon(Icons.email),
                  ),
                );
              },
            ),
            const SizedBox(height: 16.0),

            // Campo de Senha
            ValueListenableBuilder<String?>(
              valueListenable: controller.passwordError,
              builder: (context, error, child) {
                return TextField(
                  obscureText: true,
                  onChanged: (value) => controller.password = value,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    errorText: error,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    prefixIcon: const Icon(Icons.lock),
                  ),
                );
              },
            ),
            const SizedBox(height: 16.0),

            // Campo de CNPJ
            ValueListenableBuilder<String?>(
              valueListenable: controller.matriculaError,
              builder: (context, error, child) {
                return TextField(
                  onChanged: (value) => controller.matricula = value,
                  decoration: InputDecoration(
                    labelText: 'Matricula',
                    errorText: error,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    prefixIcon: const Icon(Icons.business),
                  ),
                );
              },
            ),
            const SizedBox(height: 24.0),

            // Botão de Cadastro
            ElevatedButton(
              onPressed: () async {
                final success = await controller.registerUser();
                if (success) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Usuário cadastrado com sucesso!')),
                  );
                  Navigator.pop(context); // Retorna para a tela anterior
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Erro ao cadastrar usuário.')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                backgroundColor: Color(0xFF4059D7),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  
                ),
              ),
              child: const Text(
                'Cadastrar',
                style: TextStyle(fontSize: 18.0, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}