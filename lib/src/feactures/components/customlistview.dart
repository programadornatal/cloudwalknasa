import 'package:cloudwalknasa/src/feactures/components/customlistviewitem.dart';
import 'package:flutter/material.dart';

class Customlistview extends StatefulWidget {
  const Customlistview({Key? key}) : super(key: key);
  @override
  State<Customlistview> createState() => _CustomlistViewState();
}

class _CustomlistViewState extends State<Customlistview> {
  final List<Map<String, dynamic>> _allImages = [
    {'id': 1, 'title': 'Fabio Santos', 'data': '2023-08-23'},
    {'id': 2, 'title': 'Talyssa Andrade', 'data': '2023-08-21'},
    {'id': 3, 'title': 'Jose Pereira', 'data': '2023-08-19'},
    {'id': 4, 'title': 'Marcos Paulo', 'data': '2023-08-13'},
    {'id': 5, 'title': 'Jose Joaquim', 'data': '2023-07-10'},
    {'id': 6, 'title': 'Talyssa Andrade', 'data': '2023-08-21'},
    {'id': 7, 'title': 'Jose Pereira', 'data': '2023-08-19'},
    {'id': 8, 'title': 'Marcos Paulo', 'data': '2023-08-13'},
    {'id': 9, 'title': 'Jose Joaquim', 'data': '2023-07-10'},
    {'id': 10, 'title': 'Talyssa Andrade', 'data': '2023-08-21'},
    {'id': 11, 'title': 'Jose Pereira', 'data': '2023-08-19'},
    {'id': 12, 'title': 'Marcos Paulo', 'data': '2023-08-13'},
    {'id': 13, 'title': 'Jose Joaquim', 'data': '2023-07-10'},
  ];

  List<Map<String, dynamic>> _foundUsers = [];
  @override
  void initState() {
    _foundUsers = _allImages;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allImages;
    } else {
      results = _allImages
          .where((image) => (image['title']
                  .toLowerCase()
                  .contains(enteredKeyword.toLowerCase()) ||
              (image['data']
                  .toLowerCase()
                  .contains(enteredKeyword.toLowerCase()))))
          .toList();
    }

    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              onChanged: (text) => _runFilter(text),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a search term',
              ),
            ),
          ),
          Expanded(
            child: _foundUsers.isNotEmpty
                ? ListView.builder(
                    itemCount: _foundUsers.length,
                    itemBuilder: (context, index) => Customlistviewitem(
                          key: ValueKey(_foundUsers[index]['id']),
                          title: _foundUsers[index]['title'],
                          data: _foundUsers[index]['data'],
                        ))
                : const Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'No results found',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
