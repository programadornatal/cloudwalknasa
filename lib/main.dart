import 'package:cloudwalknasa/src/imageoftheday_app.dart';
import 'package:cloudwalknasa/src/viewmodels/nasa_apod_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => NasaApodViewModel(),
      child: const MaterialApp(
        home: Imageoftheday(),
      ),
    ),
  );
}
