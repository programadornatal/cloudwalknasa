import 'package:flutter/material.dart';
import '../data/remote/nasa_api_provider.dart';
import '../models/nasa_apod.dart';

class NasaApodViewModel with ChangeNotifier {
  final NasaApiProvider _apiProvider = NasaApiProvider();

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  List<NasaApod> _apodList = [];
  bool _isLoading = false;

  List<NasaApod> get apodList => _apodList;
  bool get isLoading => _isLoading;

  List<NasaApod> _filteredApodList = [];
  List<NasaApod> get filteredApodList => _filteredApodList;
  set filteredApodList(List<NasaApod> value) {
    _filteredApodList = value;
    notifyListeners();
  }

  Future<void> fetchApodData(String startDate, String endDate) async {
    try {
      _isLoading = true;
      final List<NasaApod> data =
          await _apiProvider.fetchApodData(startDate, endDate);
      _apodList = data;
      _errorMessage = null; // Limpa a mensagem de erro se tudo der certo
    } catch (error) {
      _errorMessage = 'Failed to load data';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
