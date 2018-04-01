import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:game_freak/game/game.dart';
import 'package:game_freak/game/game_detail_page.dart';
import 'package:http/http.dart' as http;

class GameListPage extends StatefulWidget {
  @override
  GameListPageState createState() => new GameListPageState();
}

class GameListPageState extends State<GameListPage> {

  String _url = "https://www.giantbomb.com/api/games/?api_key=b6b0857eb0c182188ee8d5abaccf6156783897cc&format=json&filter=platforms:43&fields=name,deck,image,api_detail_url,site_detail_url&sort=name:asc&offset=173&limit=25";
  List<Game> _games = new List();

  Future<List<Game>> _fetchGames() async {
    var response = await http
        .get(Uri.encodeFull(_url), headers: {"Accept": "application/json"});

    this.setState(() {
      Map gamesResponse = json.decode(response.body);
      for (Map gameMap in gamesResponse["results"]) {
        Game game = new Game(gameMap);
        _games.add(game);
      }
    });

    return _games;
  }

  @override
  void initState() {
    this._fetchGames();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Game Freak"),
        backgroundColor: new Color(0xFFFF0000),
      ),
      body: new ListView.builder(
        padding: kMaterialListPadding,
        itemCount: _games == null ? 0 : _games.length,
        itemBuilder: (BuildContext context, int index) {
          final Game game = _games[index];
          return new ListTile(
            leading: new Image.network(game.iconUrl()),
            title: new Text(game.name()),
            onTap: () {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => new GameDetailPage(game)),
              );
            },
          );
        },
      ),
    );
  }
}
