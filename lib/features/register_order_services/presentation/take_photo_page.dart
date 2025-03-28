
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:camera/camera.dart';

class TakePhotoPage extends StatefulWidget {
  const TakePhotoPage({
    super.key,
  });

  @override
  State<TakePhotoPage> createState() => _TakePhotoPageState();
}

class _TakePhotoPageState extends State<TakePhotoPage> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  CameraDescription cameraDescription = const CameraDescription(
    name: 'camera',
    lensDirection: CameraLensDirection.back,
    sensorOrientation: 0,
  );
  @override
  void initState() {
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      cameraDescription,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );
    _initializeControllerFuture = _controller.initialize();
    super.initState();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
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
              const SizedBox(height: 16.0),

              FutureBuilder<void>(
                future: _initializeControllerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return CameraPreview(_controller);
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
              const SizedBox(height: 24.0),

              // Botão circular estilo câmera
              Center(
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 4),
                  ),
                  child: Material(
                    color: const Color(0xFF4059D7),
                    shape: const CircleBorder(),
                    child: InkWell(
                      customBorder: const CircleBorder(),
                      onTap: () async {
                        // Take the Picture in a try / catch block. If anything goes wrong,
                        // catch the error.
                        try {
                          // Ensure that the camera is initialized.
                          await _initializeControllerFuture;

                          // Attempt to take a picture and get the file `image`
                          // where it was saved.
                          final image = await _controller.takePicture();

                          if (!context.mounted) return;

                          context.pop(
                            image.path,
                          );
                        } catch (e) {
                          // If an error occurs, log the error to the console.
                          print(e);
                        }
                      },
                      child: const Center(
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


