import 'package:cloudwalknasa/src/feactures/components/customlistviewitem.dart';
import 'package:flutter/material.dart';

class Customlistview extends StatelessWidget {
  const Customlistview({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: const [
        Customlistviewitem(
          title: "Fabio",
        ),
        Customlistviewitem(
          title: "Talyssa",
        )
      ],
    );
  }
}
