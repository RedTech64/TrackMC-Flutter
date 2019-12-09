import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ServerData {
  String description;
  int playerCount;
  int playerMax;
  List<String> playerList;

  ServerData({this.description,this.playerCount,this.playerMax,this.playerList});

  factory ServerData.fromJson(Map<String,dynamic> data) {
    String motd = "";
    if(data['description']['text'] == "") {
      for(var j = 0; j < data['description']['extra'].length; j++) {
        motd += data['description']['extra'][j]['text'];
      }
    } else {
      motd = data['description']['text'];
    }
    if(motd == null) {
      motd = data['description'];
    }
    motd = motd.split(new RegExp("§.")).join("");
    motd = motd.split(new RegExp("\\u.....")).join("");
    List<String> playerList = [];
    if(data['playerList'] == "n/a")
      playerList = ['N/A'];
    else
      playerList = data['playerList'];
    ServerData serverData = new ServerData(
      description: motd.toString(),
      playerCount: data['playerCount'],
      playerMax: data['playerMax'],
      playerList: playerList,
    );
    return serverData;
  }
}

class ServerCard extends StatefulWidget {
  final String ip;

  ServerCard(this.ip);

  @override
  State createState() => new _ServerCardState(this.ip);
}

class _ServerCardState extends State<ServerCard> {
  final String ip;
  ServerData data = new ServerData(description: "Loading",playerCount: 0,playerMax: 0,playerList: []);
  int _count = 0;

  _ServerCardState(this.ip);

  @override
  void initState() {
    beginUpdate();
    super.initState();
  }

  void beginUpdate() async {
    while(true) {
      ServerData newData = await fetchData();
      setState(() {
        data = newData;
        _count = _count + 1;
      });
      await new Future.delayed(new Duration(seconds: 30));
    }
  }

  Future<ServerData> fetchData() async {
    final response = await http.get('https://trackmcapi-gdq3jycnxq-uc.a.run.app/?ip='+ip);
    if (response.statusCode == 200) {
      return new ServerData.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Card(
        child: new Column(
          children: <Widget>[
            new Text("IP: $ip"),
            new Text("MOTD: ${data.description}"),
            new Text("Players: ${data.playerCount}/${data.playerMax}"),
            new Text("Online: ${data.playerList.toString()}"),
          ],
        ),
      ),
    );
  }
}