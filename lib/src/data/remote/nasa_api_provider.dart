import 'dart:convert';
import 'package:cloudwalknasa/src/models/nasa_apod.dart';
import 'package:http/http.dart' as http;

class NasaApiProvider {
  late String apiKey = 'DEMO_KEY';
  late String baseUrl = 'https://api.nasa.gov/planetary/apod';

  Future<List<NasaApod>> fetchApodData(String startDate, String endDate) async {
    final response = await http.get(Uri.parse(
        '$baseUrl?api_key=$apiKey&start_date=$startDate&end_date=$endDate'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      final List<NasaApod> apodList =
          jsonData.map((item) => NasaApod.fromJson(item)).toList();
      return apodList.reversed.toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
