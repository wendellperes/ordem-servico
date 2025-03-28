import 'package:desafio_os/features/home/router.dart';
import 'package:desafio_os/features/register_user/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:desafio_os/features/login/presentation/login_page/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    required this.controller,
    super.key,
  });

  final LoginController controller;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final controller = widget.controller;

  @override
  void initState() {
    super.initState();
    controller.state.addListener(_pushPageListener);
  }

  Future<void> _pushPageListener() async {
    if (controller.state.value == PageState.success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login realizado com sucesso!'),
        ),
      );
      context.pushReplacement(HomeRoutes.homeRoute);
      return;
    }
    if (controller.state.value == PageState.error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content:
                Text('Erro ao realizar login. Verfique seu email ou senha.')),
      );
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF2b4bfe),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Título
              const Text(
                'Registro de Atividades',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4059D7),
                  fontFamily: 'Montserrat',
                ),
              ),
              const SizedBox(height: 60.0),
              // Campo de Usuário
              TextField(
                onChanged: (value) => controller.email = value,
                decoration: InputDecoration(
                  labelText: 'Usuário',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  prefixIcon: const Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 16.0),

              // Campo de Senha
              TextField(
                obscureText: true,
                onChanged: (value) => controller.password = value,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  prefixIcon: const Icon(Icons.lock),
                ),
              ),
              const SizedBox(height: 24.0),

              // Botão de Login
              ElevatedButton(
                onPressed: () => controller.getUser(),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  backgroundColor: const Color(0xFF4059D7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  'Entrar',
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
              ),
              const SizedBox(height: 24.0),

              // Cards lado a lado
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Card para "Esqueci minha senha"
                  Expanded(
                    child: Card(
                      color: const Color(
                          0xFF4059D7), // Mesma cor do botão "Entrar"
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: InkWell(
                        onTap: () {
                          // context.push(LoginRoutes.recoveryPassword);
                        },
                        borderRadius: BorderRadius.circular(16.0),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(Icons.lock_reset,
                                  color: Colors.white, size: 40),
                              SizedBox(height: 8.0),
                              Text(
                                'Esqueci minha senha',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16.0, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16.0),

                  // Card para "Criar Usuário"
                  Expanded(
                    child: Card(
                      color: const Color(
                          0xFF4059D7), // Cor mais clara baseada no botão "Entrar"
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: InkWell(
                        onTap: () {
                          context.push(RegisterRoutes.registerRoute);
                        },
                        borderRadius: BorderRadius.circular(16.0),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(Icons.person_add,
                                  color: Colors.white, size: 40),
                              SizedBox(height: 8.0),
                              Text(
                                'Cadastrar Novo Usuário',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16.0, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
