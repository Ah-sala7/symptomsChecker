import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:symptoms/preview_page.dart';

class ScanTabProvider extends ChangeNotifier {
  late CameraController _cameraController;
  bool _isRearCameraSelected = true;
  bool _flashIsOpened = false;
  late List<CameraDescription> _cameras;
  String? _pickedImagePath;

  bool get isRearCameraSelected => _isRearCameraSelected;
  bool get flashIsOpened => _flashIsOpened;
  String? get pickedImagePath => _pickedImagePath;
  CameraController get cameraController => _cameraController;
  List<CameraDescription> get cameras => _cameras;

  late Future<void> cameraInitialized;

  ScanTabProvider() {
    cameraInitialized = _initializeCameras();
  }

  Future<void> _initializeCameras() async {
    _cameras = await availableCameras();
    await _initializeCameraController();
  }

  Future<void> _initializeCameraController() async {
    _cameraController = CameraController(
      _isRearCameraSelected ? _cameras[0] : _cameras[1],
      ResolutionPreset.high,
    );
    await _cameraController.initialize();
    notifyListeners();
  }

  Future<void> toggleFlash() async {
    _flashIsOpened = !_flashIsOpened;
    await _cameraController.setFlashMode(
      _flashIsOpened ? FlashMode.torch : FlashMode.off,
    );
    notifyListeners();
  }

  Future<void> takePicture(BuildContext context) async {
    if (!_cameraController.value.isInitialized || _cameraController.value.isTakingPicture) {
      return;
    }
    try {
      await _cameraController.setFlashMode(FlashMode.off);
      XFile picture = await _cameraController.takePicture();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PreviewPage(picture: picture),
        ),
      );
    } catch (e) {
      debugPrint('Error occurred while taking picture: $e');
    }
  }

  Future<void> pickImageFromGallery(BuildContext context) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      _pickedImagePath = pickedImage.path;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PreviewPage(picture: XFile(pickedImage.path)),
        ),
      );
      notifyListeners();
    }
  }

  void switchCamera(BuildContext context) async {
    _isRearCameraSelected = !_isRearCameraSelected;
    await _initializeCameraController();
    notifyListeners();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }
}
