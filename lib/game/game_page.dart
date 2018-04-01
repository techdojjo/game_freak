import 'package:flutter/material.dart';
import 'package:game_freak/game/game.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class GamePage extends StatefulWidget {
  Game game;

  GamePage(Game game) {
    this.game = game;
  }

  @override
  State createState() {
    return new GamePageState(game);
  }
}

class GamePageState extends State<GamePage> {
  Game game;

  GamePageState(Game game) {
    this.game = game;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          backgroundColor: new Color(0xFFFF0000),
          title: new Text(game.name()),
          actions: <Widget>[
            new IconButton(
                icon: const Icon(Icons.web),
                tooltip: 'Refresh',
                onPressed: () {
                  _launchURL(game);
                }),
          ]),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new AspectRatio(
              aspectRatio: 16 / 9,
              child: new Container(
                decoration: new BoxDecoration(
                    color: Colors.black,
                    image: new DecorationImage(
                      fit: BoxFit.fitWidth,
                      alignment: FractionalOffset.topCenter,
                      image: new NetworkImage(game.screenUrl()),
                    )),
              ),
            ),
            new Container(
                padding: new EdgeInsets.all(8.0),
                child: new Text(
                  game.deck(),
                  style: new TextStyle(fontSize: 22.0),
                ))
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        backgroundColor: new Color(0xFFFF0000),
        onPressed: () {
          _share();
        },
        tooltip: 'Increment',
        child: new Icon(Icons.share),
      ),
    );
  }

  _share() {
    if (game != null) {
      share(game.siteDetailUrl());
    }
  }

  _launchURL(Game game) async {
    String url = game.siteDetailUrl();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
