import 'package:flutter/material.dart';
import 'package:symptoms/symptomSelector.dart';

class CategoryPage extends StatelessWidget {
  final List<String> categories = [
    'Head',
    'Neck',
    'Shoulder',
    'Elbow',
    'Wrist',
    'Lumbar',
    'Hip',
    'Knee',
    'Foot',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Top image section
          Container(
            padding: EdgeInsets.all(5),
            child: Image.asset(
              'assets/images/orthopedics.png',
              height: 300,
              width: 400,
              fit: BoxFit.contain,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      // Navigate to SymptomsSelector with selected category
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SymptomsSelector(category: categories[index]),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(30), // Semi-circular border
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            blurRadius: 5,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                      child: ListTile(
                        title: Text(
                          categories[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
