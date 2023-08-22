import 'package:cloudwalknasa/src/feactures/listofimages_page.dart';
import 'package:flutter/material.dart';

class Imageoftheday extends StatelessWidget {
  const Imageoftheday({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nasa Image of the Day',
      routes: {'/': (_) => const ListofimagePage()},
    );
  }
}
