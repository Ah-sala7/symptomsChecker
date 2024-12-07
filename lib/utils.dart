// utils.dart
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';

Future<List<List<dynamic>>> loadCsv(String path) async {
  final rawData = await rootBundle.loadString(path);
  return const CsvToListConverter().convert(rawData);
}
