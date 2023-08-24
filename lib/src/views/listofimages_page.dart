import 'package:cloudwalknasa/src/views/components/customlistview.dart';
import 'package:flutter/material.dart';

class ListofimagePage extends StatelessWidget {
  const ListofimagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of Images'),
      ),
      body: const Customlistview(),
    );
  }
}
