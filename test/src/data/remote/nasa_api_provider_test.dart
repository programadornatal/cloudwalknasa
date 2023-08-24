import 'package:cloudwalknasa/src/data/remote/nasa_api_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;
import 'package:cloudwalknasa/src/models/nasa_apod.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  group('NasaApiProvider', () {
    late NasaApiProvider nasaApiProvider;
    late MockHttpClient mockHttpClient;

    setUp(() {
      mockHttpClient = MockHttpClient();
      nasaApiProvider = NasaApiProvider();
      nasaApiProvider.apiKey = 'DEMO_KEY';
      nasaApiProvider.baseUrl = 'https://api.nasa.gov/planetary/apod';
      registerFallbackValue(Uri.parse('https://api.nasa.gov/planetary/apod'));
    });

    test('fetchApodData - Retorna lista de NasaApod', () async {
      final mockResponse = http.Response(
        '[{"title": "Título 1", "date": "2023-08-23"}, {"title": "Título 2", "date": "2023-08-22"}]',
        200,
      );
      when(() => mockHttpClient.get(any()))
          .thenAnswer((_) async => mockResponse);
      final result =
          await nasaApiProvider.fetchApodData('2023-08-20', '2023-08-21');
      expect(result, isA<List<NasaApod>>());
      expect(result.length, 2);
    });

    test('fetchApodData - Lança exceção em caso de erro de rede', () async {
      when(() => mockHttpClient.get(any()))
          .thenAnswer((_) async => http.Response('Error', 500));
      expect(() => nasaApiProvider.fetchApodData('2023-08-01', '2023-08-31'),
          throwsException);
    });
  });
}
