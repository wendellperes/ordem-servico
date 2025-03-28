import 'dart:io';

import 'package:desafio_os/features/register_order_services/route.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'list_order_service_controller.dart';

class CreateOrderServicePage extends StatefulWidget {
  const CreateOrderServicePage({
    required this.controller,
    super.key,
  });

  final CreateOrderServiceController controller;

  @override
  State<CreateOrderServicePage> createState() => _CreateOrderServicePageState();
}

class _CreateOrderServicePageState extends State<CreateOrderServicePage> {
  late final controller = widget.controller;

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
              // Campo de Título
              ValueListenableBuilder<String?>(
                valueListenable: controller.titleError,
                builder: (context, error, child) {
                  return TextField(
                    onChanged: (value) => controller.title = value,
                    decoration: InputDecoration(
                      labelText: 'Título da Atividade',
                      errorText: error,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                            color: Color(0xFF2b4bfe), width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                            color: Color(0xFF4059D7), width: 2),
                      ),
                      prefixIcon: const Icon(Icons.title),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16.0),

              // Campo de Descrição
              ValueListenableBuilder<String?>(
                valueListenable: controller.descriptionError,
                builder: (context, error, child) {
                  return TextField(
                    onChanged: (value) => controller.description = value,
                    maxLines: 4,
                    minLines: 3,
                    textAlignVertical: TextAlignVertical.top,
                    decoration: InputDecoration(
                      labelText: 'Descrição',
                      alignLabelWithHint: true,
                      errorText: error,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                            color: Color(0xFF2b4bfe), width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(
                            color: Color(0xFF4059D7), width: 2),
                      ),
                      prefixIcon: const Padding(
                        padding: EdgeInsets.only(bottom: 50),
                        child: Icon(Icons.description),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16.0),

              // Campo de Checklist
              ValueListenableBuilder<String?>(
                valueListenable: controller.checklistError,
                builder: (context, error, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Checklist:',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      RadioListTile<String>(
                        title: const Text('Opção 1'),
                        value: 'Opção 1',
                        groupValue: controller.selectedChecklistOption,
                        onChanged: (value) {
                          setState(() {
                            controller.selectedChecklistOption = value!;
                          });
                        },
                      ),
                      RadioListTile<String>(
                        title: const Text('Opção 2'),
                        value: 'Opção 2',
                        groupValue: controller.selectedChecklistOption,
                        onChanged: (value) {
                          setState(() {
                            controller.selectedChecklistOption = value!;
                          });
                        },
                      ),
                      RadioListTile<String>(
                        title: const Text('Opção 3'),
                        value: 'Opção 3',
                        groupValue: controller.selectedChecklistOption,
                        onChanged: (value) {
                          setState(() {
                            controller.selectedChecklistOption = value!;
                          });
                        },
                      ),
                      if (error != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            error,
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 16.0),

              // Botão para tirar foto
              ElevatedButton.icon(
                onPressed: () async {
                  // Lógica para tirar foto

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Abrindo câmera...')),
                  );
                  controller.imagePath.value = await context
                          .push<String>(OrderServiceRoutes.takePhotoRoute) ??
                      '';
                },
                icon: const Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                ),
                label: const Text(
                  'Tirar Foto',
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  backgroundColor: const Color(0xFF4059D7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 24.0),

              ValueListenableBuilder(
                valueListenable: controller.imagePath,
                builder: (_, image, __) {
                  if (image.isEmpty) {
                    return const SizedBox.shrink();
                  }
                  return Container(
                    width: 500,
                    height: 550,
                    child: DisplayPictureScreen(
                      imagePath: image,
                    ),
                  );
                },
              ),
              const SizedBox(height: 24.0),

              // Botão de Enviar
              ElevatedButton(
                onPressed: () {
                  
                  if (controller.validateFields()) {
                    controller.registerOrderService();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content:
                            Text('Ordem de serviço registrada com sucesso!'),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Preencha todos os campos corretamente.'),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  backgroundColor: const Color(0xFF4059D7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  'Registrar',
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Column(
        children: [
          Text(
            'Preview',
            style: TextStyle(fontSize: 20),
          ),
          Image.file(File(imagePath)),
        ],
      ),
    );
  }
}
