import 'package:flutter/material.dart';
import 'modelService.dart';

class ResultScreen extends StatefulWidget {
  final List<String> symptoms;
  final ModelService modelService;

  const ResultScreen({
    super.key,
    required this.symptoms,
    required this.modelService,
  });

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  List<dynamic>? _predictions;

  @override
  void initState() {
    super.initState();
    _fetchPredictions();
  }

  Future<void> _fetchPredictions() async {
    try {
      // Convert symptoms into a format the model can use
      Map<String, int> symptomsMap = {
        for (var symptom in widget.symptoms) symptom: 1, // Example encoding
      };
      List<dynamic>? predictions =
      await widget.modelService.predict(symptomsMap);
      setState(() {
        _predictions = predictions;
      });
    } catch (e) {
      print("Error during prediction: $e");
      setState(() {
        _predictions = ["Error occurred"];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Result")),
      body: Center(
        child: _predictions == null
            ? const CircularProgressIndicator()
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Predictions:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ..._predictions!.map((prediction) => Text(
              prediction.toString(),
              style: const TextStyle(fontSize: 16),
            )),
          ],
        ),
      ),
    );
  }
}
