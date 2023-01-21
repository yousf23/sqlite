import 'package:ddddddddddd/withwael.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

SqlDb sqlDb = SqlDb();

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [

            ElevatedButton(

                onPressed: () async {
                  int response = await sqlDb.insertData(
                      "INSERT INTO 'notes' (note) VALUES ('note 777777777')");

                  print(response);
                },
                child: Text('inseartData')),
            ElevatedButton(
                onPressed: () async {
                  List<Map> response =
                      await sqlDb.readData("SELECT * FROM 'notes'");

                  print("$response");
                },
                child: Text('ReadData')),
            ElevatedButton(
                onPressed: () async {
                  int response = await sqlDb
                      .deleteData("DELETE  FROM  'notes' WHERE id = 3  ");
                  print('$response');
                },
                child: Text('delete AlL')),
            ElevatedButton(
                onPressed: () async {
                  var response = await sqlDb.updateData(
                      "UPDATE 'notes' SET 'note' = 'note six' WHERE  id = 2");
                  print('$response');
                },
                child: Text('update'))
          ],
        ),
      ),
    );
  }
}
