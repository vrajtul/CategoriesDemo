import 'package:catelog_demo/list_data.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  static List<String> entries = <String>[
    'hemal',
    'Denny',
  ];

  final _formKey = GlobalKey<FormState>();
  String etData = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Category",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: DataListView(entries: entries),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // showDialog(context: context, builder: (context) => CustomDialog());
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: const Text("Add Category"),
              content: const Text("Fill your name in categories"),
              actions: <Widget>[
                // TextButton(
                //   onPressed: () {
                //     Navigator.of(ctx).pop();
                //   },

                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          onChanged: (value) {
                            etData = value;
                          },
                          maxLength: 8,
                          decoration: InputDecoration(
                              labelText: "Name",
                              prefixIcon:
                                  const Icon(Icons.person_outline_rounded),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              hintText: "Enter Name"),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter Name First';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 22.0,
                        ),
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  entries.add(etData);
                                });
                                Navigator.of(ctx).pop();
                              } else {}
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width,
                              height: 50.0,
                              padding: const EdgeInsets.all(14.0),
                              decoration: const BoxDecoration(
                                  color: Colors.deepPurple,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: const Text(
                                " Add ",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18.0),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 22.0,
                        ),
                      ],
                      // ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
