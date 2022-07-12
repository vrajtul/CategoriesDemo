import 'package:flutter/material.dart';

class DataListView extends StatefulWidget {
  final List<String> entries;

  DataListView({Key? key, required this.entries}) : super(key: key);

// final List<> list;
  @override
  State<DataListView> createState() => _DataListViewState(this.entries);
}

class _DataListViewState extends State<DataListView> {
  final List<String> entries;

  _DataListViewState(this.entries);
  static List<String> entriess = <String>['hemal', 'Radhe'];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11.0), color: Colors.blue),
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
            height: 70,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // width: MediaQuery.of(context).size.width,
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 80.0),
                    child: Text(
                      entries[index],
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  )),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      entries.removeAt(index);
                    });
                  },
                  child: Container(
                      width: 55.0,
                      height: 55.0,
                      decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Icon(Icons.delete, color: Colors.white)),
                )
              ],
            ));
      },
    );
  }
}
