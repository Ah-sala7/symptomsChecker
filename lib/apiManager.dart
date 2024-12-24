import 'dart:convert';
import 'package:http/http.dart' as http;
import 'SymptomsModel.dart';  // Import the SymptomsModel

class ApiManager {
  final String baseUrl;

  ApiManager({this.baseUrl = 'https://web-production-2748b.up.railway.app'});

  Future<SymptomsModel> sendSymptoms(List<int> symptomsData) async {
    final url = '$baseUrl/predict'; // Using the public API URL

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'symptoms': symptomsData}),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        // Parse the JSON response into SymptomsModel
        Map<String, dynamic> responseData = jsonDecode(response.body);

        // Convert the response data to SymptomsModel
        SymptomsModel symptomsModel = SymptomsModel.fromJson(responseData);

        return symptomsModel; // Return the SymptomsModel object
      } else {
        throw Exception('Failed to fetch data: ${response.statusCode}');
      }
    } catch (error) {
      print('Error while sending symptoms: $error');
      throw Exception('Error while sending symptoms: $error');
    }
  }
}
