import 'package:flutter/material.dart';
import 'package:symptoms/DrugInfo.dart';
import 'package:symptoms/SymptomsModel.dart';
import 'package:symptoms/apiManager.dart';
class SymptomsSelector extends StatefulWidget {
  final String category;

  const SymptomsSelector({Key? key, required this.category}) : super(key: key);

  @override
  _SymptomsSelectorState createState() => _SymptomsSelectorState();
}

class _SymptomsSelectorState extends State<SymptomsSelector> {
  // Track selected symptoms for the current category
  late List<bool> selectedSymptoms;

  final Map<String, List<String>> categorySymptoms = {
    'head': [
      'dull head pain',
      'Pressure around forehead',
      'tenderness around forehead and scalp'
    ],
    'neck': [
      'Radiating Pain',
      'Numbness',
      'Muscle Weakness',
      'Mild to severe pain in the neck',
      'Difficulty moving the neck',
      'Sudden, involuntary contractions of neck muscles.'
    ],
    'shoulder': [
      'Pain in the Shoulder',
      'Limited Range of Motion',
      'Stiffness',
      'Pain in the top and outer side of your shoulder.',
      'Pain worsen when lifting arm, especially when above head.',
      'Overall weakness in arm',
      'Cracking sounds when moving your arm',
      'Limited ability to move arm',
      'Pain keeps coming back, especially when lifting arm overhead.'
    ],
    'elbow': [
      'Pain along the inside of the forearm from elbow to wrist',
      'Pain when flexing the wrist when palm face downward',
      'Pain when shaking hand with someone.'
    ],
    'wrist': [
      'Tingling',
      'Pain often exacerbated by repetitive hand movements',
      'Difficulty gripping objects or performing everyday tasks that require hand strength',
      'Pain and discomfort in the wrist, especially with movement or pressure.',
      'Swelling and potential bruising.',
      'Limited range of motion and difficulty moving the wrist.'
    ],
    'lumbar': [
      'Pain, numbness, tingling, or muscle weakness that travels into the buttocks, hip, groin, or leg.',
      'Sharp pain that begins in the lower back and moves down the leg.',
      'Weakness in the leg with motion.'
    ],
    'hip': [
      'Lateral knee pain on Certain Movements',
      'Stair Climbing',
      'Limited Range of Motion',
      'Pain localized in the front of the hip or groin area',
      'Feeling of tightness in the hip or groin area',
      'Difficulty in extending the hip fully or performing hip flexion without discomfort.'
    ],
    'knee': [
      'Pain along the inner side of the knee, especially during movement.',
      'Swelling around the knee joint, often localized to the inner.',
      'Instability or feeling of the knee "giving way" under pressure.',
      'Pain in the front of the knee, particularly around or behind the kneecap.',
      'Grinding or popping sensation when bending or extending the knee.',
      'Worsening pain during activities such as climbing stairs, squatting, or running.'
    ],
    'foot': [
      'Foot pain',
      'Changes in foot shape',
      'Changes in gait',
      'Morning stiffness',
      'Pain when going up or down stairs',
      'Visible inflammation'
    ],
  };
  // Define the size of each category in order
  final List<int> categorySizes = [3, 6, 9, 3, 6, 3, 6, 6, 6];
  final List<String> categoryOrder = [
    'Head', 'Neck', 'Shoulder', 'Elbow', 'Wrist', 'Lumbar', 'Hip', 'Knee', 'Foot'
  ];


  @override
  void initState() {
    super.initState();
    selectedSymptoms = List.generate(
      getSymptomsForCategory(widget.category).length,
          (index) => false,
    ); // Initialize selection list based on category
  }

  // Get symptoms for the selected category
  List<String> getSymptomsForCategory(String category) {
    return categorySymptoms[category.toLowerCase()] ?? [];
  }

  // Get the starting index for the selected category
  void submitSymptoms() async {
    // Initialize symptoms data with 48 zeros
    List<int> symptomsData = List.generate(48, (index) => 0);
    List<String> currentCategorySymptoms = getSymptomsForCategory(widget.category);

    // Check if the category has symptoms, and handle edge case if not
    if (currentCategorySymptoms.isEmpty) {
      print('No symptoms found for category: ${widget.category}');
      return; // Return early if no symptoms are available for this category
    }

    int startIndex = getStartIndexForCategory(widget.category);  // Get the starting index for the selected category

    // Ensure the symptoms are marked correctly in the symptomsData list
    for (int i = 0; i < currentCategorySymptoms.length; i++) {
      if (selectedSymptoms[i]) {
        symptomsData[startIndex + i] = 1;
      }
    }

    final apiManager = ApiManager();

    try {
      // Send symptoms data to the API
      SymptomsModel response = await apiManager.sendSymptoms(symptomsData);
      showPredictionDialog(context, response);
    } catch (e) {
      // Handle API errors
      print('Error while submitting symptoms: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error submitting symptoms: $e')),
      );
    }
  }



// Get the starting index for the selected category
  // Get the starting index for the selected category
  // Get the starting index for the selected category with case insensitivity
  int getStartIndexForCategory(String category) {
    print("Selected category: $category");

    // Make both the category and categoryOrder values lowercase to avoid case sensitivity issues
    int categoryIndex = categoryOrder.indexWhere((cat) => cat.toLowerCase() == category.toLowerCase());

    if (categoryIndex == -1) {
      print('Error: Category "$category" not found in categoryOrder!');
      return 0; // If category is not found, return 0 (safe fallback)
    }

    // Calculate the start index by summing the sizes of all previous categories
    int startIndex = categorySizes.sublist(0, categoryIndex).fold(0, (sum, size) => sum + size);

    print("Calculated start index for $category: $startIndex");

    return startIndex;
  }

  void showPredictionDialog(BuildContext context, SymptomsModel response) {
    String disease = response.disease ?? 'Unknown Disease';
    double confidence = response.confidence ?? 0.0;
    List<DrugInfo>? drugInfo = response.drugInfo;
    String? nutrition = response.drugInfo?[0].nutrition;  // Assuming 'nutrition' exists in the model
    String? pt = response.drugInfo?[0].pt;  // Assuming 'pt' exists in the model

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Column(
            children: [
              CircleAvatar(
                radius: 60,  // Larger circle avatar radius
                backgroundImage: AssetImage("assets/images/splash screen.jpeg"),
              ),
              SizedBox(height: 16),  // Spacer for some distance between avatar and title
              Text('Prediction', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ],
          ),
          content: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Disease text
                  Text('1) Disease:', style: TextStyle(fontSize: 18, color: Colors.grey)),
                  Text(disease, style: TextStyle(fontSize: 18, color: Colors.black)),
                  SizedBox(height: 8),  // New line before confidence

                  // Confidence text
                  Text('2) Confidence:', style: TextStyle(fontSize: 18, color: Colors.grey)),
                  Text('${confidence.toStringAsFixed(2)}%', style: TextStyle(fontSize: 18, color: Colors.black)),
                  SizedBox(height: 16),  // Spacer before drug info

                  if (drugInfo != null && drugInfo.isNotEmpty) ...[
                    // Suggested Drug info
                    Text('3) Suggested Drug:', style: TextStyle(fontSize: 18, color: Colors.grey)),
                    Text('${drugInfo[0].drug}', style: TextStyle(fontSize: 18, color: Colors.black)),
                    SizedBox(height: 8),

                    // Side Effects
                    Text('Side Effects:', style: TextStyle(fontSize: 18, color: Colors.grey)),
                    Text('${drugInfo[0].sideeffectandallergy}', style: TextStyle(fontSize: 18, color: Colors.black)),
                    SizedBox(height: 8),

                    // Exercise
                    Text('Exercise:', style: TextStyle(fontSize: 18, color: Colors.grey)),
                    Text('${drugInfo[0].exerciseandlink}', style: TextStyle(fontSize: 18, color: Colors.black)),
                  ],

                  // Nutrition text (if available)
                  if (nutrition != null && nutrition.isNotEmpty) ...[
                    SizedBox(height: 16),
                    Text('4) Nutrition:', style: TextStyle(fontSize: 18, color: Colors.grey)),
                    Text(nutrition, style: TextStyle(fontSize: 18, color: Colors.black)),
                  ],

                  // PT text (if available)
                  if (pt != null && pt.isNotEmpty) ...[
                    SizedBox(height: 16),
                    Text('5) Physical Therapy:', style: TextStyle(fontSize: 18, color: Colors.grey)),
                    Text(pt, style: TextStyle(fontSize: 18, color: Colors.black)),
                  ],
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close', style: TextStyle(fontSize: 18)),
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    List<String> symptoms = getSymptomsForCategory(widget.category);

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.category} Symptoms'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Add CircleAvatar at the top of SymptomsSelector page
            CircleAvatar(
              radius: 100,  // Larger circle avatar radius
              backgroundImage: AssetImage("assets/images/splash screen.jpeg"),
            ),
            SizedBox(height: 16),  // Spacer
            Expanded(
              child: ListView.builder(
                itemCount: symptoms.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    title: Text(
                      symptoms[index],
                      style: TextStyle(fontSize: 18), // Enlarged text
                    ),
                    value: selectedSymptoms[index],
                    onChanged: (bool? value) {
                      setState(() {
                        selectedSymptoms[index] = value ?? false;
                      });
                    },
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: submitSymptoms,
              child: Text('Submit Symptoms', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
