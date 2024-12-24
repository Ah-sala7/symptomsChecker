import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:io';

class PreviewPage extends StatelessWidget {
  const PreviewPage({
    super.key,
    required this.picture,

  });

  static String routeName = 'PreviewPage';
  final XFile picture;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: FileImage(File(picture.path)),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // App logo and 'Report' text
          Container(
            margin: EdgeInsets.only(left: 50,right: 50,top: 50),
            child: Text(
              'report',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          // Dark overlay and text container
          Positioned.fill(
            top: MediaQuery.of(context).size.height * 0.6, // Adjust top position
            bottom: 20,
            left: 20,
            right: 20,
            child: Container(
              color: Colors.black.withOpacity(0.7), // Adjust opacity as needed
              padding: EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Plant Name header and value
                    Text(
                      'Disease Name:',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    SizedBox(height: 20),

                    // Disease header and value
                    Text(
                      'Treatment and PT:',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),

                    SizedBox(height: 20),

                    // Treatment header and value
                    Text(
                      'Drugs and Nutrition:',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}