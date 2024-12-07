import 'package:flutter/material.dart';

class SymptomSelector extends StatefulWidget {
  final Function(List<String>) onSelectionComplete;

  const SymptomSelector({super.key, required this.onSelectionComplete});

  @override
  _SymptomSelectorState createState() => _SymptomSelectorState();
}

class _SymptomSelectorState extends State<SymptomSelector> {
  List<String> availableSymptoms = [
    "COUGH", "MUSCLE_ACHES", "TIREDNESS",
    "SORE_THROAT", "RUNNY_NOSE", "STUFFY_NOSE",
    "FEVER", "NAUSEA", "VOMITING", "DIARRHEA",
    "SHORTNESS_OF_BREATH", "DIFFICULTY_BREATHING",
    "LOSS_OF_TASTE", "LOSS_OF_SMELL", "ITCHY_NOSE",
    "ITCHY_EYES", "ITCHY_MOUTH", "ITCHY_INNER_EAR",
    "SNEEZING", "PINK_EYE", "TYPE"
  ];
  List<String> selectedSymptoms = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select Symptoms")),
      body: ListView.builder(
        itemCount: availableSymptoms.length,
        itemBuilder: (context, index) {
          final symptom = availableSymptoms[index];
          return CheckboxListTile(
            title: Text(symptom),
            value: selectedSymptoms.contains(symptom),
            onChanged: (bool? isChecked) {
              setState(() {
                if (isChecked == true) {
                  selectedSymptoms.add(symptom);
                } else {
                  selectedSymptoms.remove(symptom);
                }
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.onSelectionComplete(selectedSymptoms);
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}
