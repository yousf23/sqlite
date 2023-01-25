import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class NextPage extends StatefulWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  String _name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Enter your name'),
            onChanged: (value) {
              _name = value;
            },
          ),
          ElevatedButton(
            child: Text('Insert'),
            onPressed: () {
              setState(() async {
                int response = await sqlDb
                    .insertData("INSERT INTO 'notes' (note) VALUES ('$_name')");
                print("$response");
              });
            },
          ),
        ],
      ),
    );
  }
}
