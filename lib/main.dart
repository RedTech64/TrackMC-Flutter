import 'package:flutter/material.dart';
import 'dart:async';
import 'add_dialogue.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> ips = [];

  @override
  void initState() {
    super.initState();
    const oneSec = const Duration(seconds:3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  void openAddServerDialogue(context) async {
    var result;
    result = await showDialog(
      context: context,
      builder: (BuildContext context) => new ServerAddDialogue(),
    );
    if(result != null) {
      setState(() {
        ips.add(result);
      });
    }
  }
}
