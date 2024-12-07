import 'package:flutter/material.dart';
import 'package:symptoms/resultScreen.dart';
import 'package:symptoms/symptomSelector.dart';

import 'modelService.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final modelService = ModelService();
  await modelService.loadModel();

  runApp(MyApp(modelService: modelService));
}

class MyApp extends StatelessWidget {
  final ModelService modelService;

  const MyApp({super.key, required this.modelService});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Symptoms Checker',
      home: HomePage(modelService: modelService),
    );
  }
}

class HomePage extends StatelessWidget {
  final ModelService modelService;

  const HomePage({super.key, required this.modelService});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SymptomSelector(
                  onSelectionComplete: (selectedSymptoms) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultScreen(
                          symptoms: selectedSymptoms,
                          modelService: modelService,
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          },
          child: const Text("Select Symptoms"),
        ),
      ),
    );
  }
}
