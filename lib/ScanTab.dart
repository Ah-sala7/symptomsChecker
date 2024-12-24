import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:symptoms/scantabProvider.dart';

class ScanTab extends StatelessWidget {
  static String routeName = 'ScanTab';

  const ScanTab({super.key});

  @override
  Widget build(BuildContext context) {
    final scanTabProvider = Provider.of<ScanTabProvider>(context);

    return Scaffold(
      body: FutureBuilder(
        future: scanTabProvider.cameraInitialized,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error initializing camera: ${snapshot.error}'),
            );
          } else {
            return Stack(
              children: [
                // Camera preview
                Positioned.fill(
                  child: OrientationBuilder(
                    builder: (context, orientation) {
                      return CameraPreview(scanTabProvider.cameraController);
                    },
                  ),
                ),

                // Center image overlay
                Center(
                  child: Image.asset(
                    'assets/images/scan2.png',
                    width: 200,
                    height: 250,
                  ),
                ),

                // Close button
                Positioned(
                  top: 20,
                  right: 20,
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('/home');
                    },
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    child: ImageIcon(
                      const AssetImage("assets/images/icons/Cross.png"),
                      color: Colors.white,
                      size: 60,
                    ),
                  ),
                ),

                // Bottom control buttons
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    color: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.image, color: Colors.white, size: 40),
                          onPressed: () => scanTabProvider.pickImageFromGallery(context),
                        ),
                        IconButton(
                          icon: Image.asset(
                            'assets/images/icons/Camera.png',
                            width: 80,
                            height: 80,
                          ),
                          onPressed: () => scanTabProvider.takePicture(context),
                        ),
                        IconButton(
                          icon: Image.asset(
                            'assets/images/icons/Rotate.png',
                            width: 40,
                            height: 40,
                          ),
                          onPressed: () => scanTabProvider.switchCamera(context),
                        ),
                      ],
                    ),
                  ),
                ),

                // Top flash control
                Positioned(
                  top: 20,
                  left: 20,
                  child: IconButton(
                    icon: Icon(
                      scanTabProvider.flashIsOpened ? Icons.flash_on : Icons.flash_off,
                      color: Colors.white,
                      size: 40,
                    ),
                    onPressed: () => scanTabProvider.toggleFlash(),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
