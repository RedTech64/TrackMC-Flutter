import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class ServerData {
  final String ip;
  final String motd;
  final int online;
  final int max;
  final List<String> sample;

  ServerData({this.ip,this.motd,this.online,this.max,this.sample});
}

class ServerCard extends StatefulWidget {
  ServerCard();

  @override
  State createState() => new _ServerCardState();
}

class _ServerCardState extends State<ServerCard> {

  @override
  void initState() {
    super.initState();
    const oneSec = const Duration(seconds:1);
    new Timer.periodic(oneSec, (Timer t) => reload());
  }

  void reload() {
    setState(() {

    });
  }

  Future<ServerData> fetchPost() async {
    final response =
    await http.get('https://jsonplaceholder.typicode.com/posts/1');

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON
      return ServerData.fromJson(json.decode(response.body));
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }

  @override
  Widget build(BuildContext context) {
    FutureBuilder(
      future: ,
      builder: null,
    ),
    return null;
  }
}