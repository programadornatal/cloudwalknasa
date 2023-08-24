import 'package:cloudwalknasa/src/models/nasa_apod.dart';
import 'package:cloudwalknasa/src/viewmodels/nasa_apod_view_model.dart';
import 'package:cloudwalknasa/src/views/components/customlistviewitem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class Customlistview extends StatefulWidget {
  const Customlistview({Key? key}) : super(key: key);
  @override
  State<Customlistview> createState() => _CustomlistViewState();
}

class _CustomlistViewState extends State<Customlistview> {
  late NasaApodViewModel viewModel;

  @override
  void initState() {
    super.initState();
    final viewModel = Provider.of<NasaApodViewModel>(context, listen: false);
    var now = DateTime.now();
    var formateDateNow = DateFormat('y-M-d').format(now);
    var nowAddMinusThen = DateTime(now.year, now.month, now.day - 10);
    var formateDateMinus = DateFormat('y-M-d').format(nowAddMinusThen);
    viewModel.fetchApodData(formateDateMinus, formateDateNow);
  }

  @override
  Widget build(BuildContext context) {
    viewModel = Provider.of<NasaApodViewModel>(context);

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (viewModel.errorMessage != null) ...[
            Center(
              child: Text(
                viewModel.errorMessage!,
                style: const TextStyle(color: Colors.red),
              ),
            ),
          ] else ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: viewModel.isLoading
                  ? Container()
                  : TextField(
                      onChanged: _runFilter,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter a search term',
                      ),
                    ),
            ),
            Expanded(
              child: viewModel.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : viewModel.filteredApodList.isNotEmpty
                      ? ListView.builder(
                          itemCount: viewModel.filteredApodList.length,
                          itemBuilder: (context, index) => Customlistviewitem(
                            title: viewModel.filteredApodList[index].title,
                            data: viewModel.filteredApodList[index].date,
                            imageUrl: viewModel.filteredApodList[index].url,
                            explanation:
                                viewModel.filteredApodList[index].explanation,
                          ),
                        )
                      : const Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            'No results found',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
            ),
          ]
        ],
      ),
    );
  }

  void _runFilter(String enteredKeyword) {
    List<NasaApod> results = [];
    if (enteredKeyword.isEmpty) {
      results = viewModel.apodList;
    } else {
      results = viewModel.apodList
          .where((apod) =>
              apod.title.toLowerCase().contains(enteredKeyword.toLowerCase()) ||
              apod.date.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      viewModel.filteredApodList = results;
    });
  }
}
