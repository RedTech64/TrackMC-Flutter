import 'package:flutter/material.dart';

class ServerAddDialogue extends StatefulWidget {
  ServerAddDialogue();

  @override
  State createState() => new _ServerAddDialogueState();
}

class _ServerAddDialogueState extends State<ServerAddDialogue> {
  TextEditingController _controller;
  String _ip = "";

  @override
  void initState() {
    super.initState();
    _controller = new TextEditingController(text: _ip);
  }

  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      title: new Text("Add Server"),
      content: new TextField(
        controller: _controller,
        onChanged: (value) {

        },
      ),
      actions: <Widget>[
        new FlatButton(
          child: new Text("ADD"),
          onPressed: () => Navigator.pop(context,_ip),
        ),
      ],
    );
  }
}