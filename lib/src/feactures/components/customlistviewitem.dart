import 'package:flutter/material.dart';

class Customlistviewitem extends StatelessWidget {
  final String title;
  const Customlistviewitem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: const Text('Testando super texto'),
        leading: ConstrainedBox(
            constraints: const BoxConstraints(
                minHeight: 44, minWidth: 44, maxHeight: 64, maxWidth: 64),
            child: Image.asset("assets/images/unavailable.jpg")),
        trailing: const Icon(Icons.navigate_next),
        onTap: () {},
      ),
    );
  }
}
