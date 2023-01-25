import 'package:ddddddddddd/nextpage.dart';
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

Future<List<Map>> readData() async {
  List<Map> response = await sqlDb.readData("SELECT * FROM 'notes'");
  return response;
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
              onPressed: () {
                sqlDb.deletemydatabase();
              },
              child: Text('delete database ')),
          ElevatedButton(
              onPressed: () async {
                int response = await sqlDb.insertData(
                    "INSERT INTO 'notes' (note) VALUES ('note 777777777')");
                print("$response");
              },
              child: Text('botton twoo ')),
          ElevatedButton(onPressed: () {

            Navigator.push(context, MaterialPageRoute(builder: (ctx){
             return NextPage();


            }));

          }, child: Text('xxxxx')),



        ],


      ),
      body: Center(
          child: FutureBuilder(
              builder: (ctx, AsyncSnapshot<List<Map>> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (ctx, i) {
                        return Card(
                          child: ListTile(
                              title: Text('${snapshot.data![i]['note']}')),
                        );
                      });
                } else {
                  return CircularProgressIndicator();
                }
              },
              future: readData())),
    );
  }
}
