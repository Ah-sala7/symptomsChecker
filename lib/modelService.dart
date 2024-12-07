import 'package:tflite_flutter/tflite_flutter.dart';
import 'dart:typed_data';

class ModelService {
  Interpreter? _interpreter; // Use nullable to avoid LateInitializationError

  Future<void> loadModel() async {
    try {
      _interpreter = await Interpreter.fromAsset('model.tflite');
      print("Model loaded successfully");
    } catch (e) {
      print("Error loading model: $e");
      _interpreter = null; // Ensure interpreter remains null if loading fails
    }
  }

  Future<List<dynamic>> predict(Map<String, int> symptoms) async {
    if (_interpreter == null) {
      throw Exception("Model is not loaded.");
    }

    final input = encodeSymptomsToBinary(symptoms);
    final output = List.filled(3, 0.0).reshape([1, 3]);

    _interpreter!.run(input, output);
    return output[0];
  }

  Uint8List encodeSymptomsToBinary(Map<String, int> symptoms) {
    final input = symptoms.values.toList();
    return Uint8List.fromList(input);
  }

  void close() {
    _interpreter?.close();
  }
}
