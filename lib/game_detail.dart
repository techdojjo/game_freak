import 'package:flutter/material.dart';
import 'package:game_freak/game.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class GameDetailPage extends StatefulWidget {
  Game _game;

  GameDetailPage(Game game) {
    this._game = game;
  }

  @override
  State createState() {
    return new GameDetailPageState(_game);
  }
}

class GameDetailPageState extends State<GameDetailPage> {
  Game _game;

  GameDetailPageState(Game game) {
    this._game = game;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          backgroundColor: new Color(0xFFFF0000),
          title: new Text(_game.name()),
          actions: <Widget>[
            new IconButton(
                icon: const Icon(Icons.web),
                tooltip: 'Refresh',
                onPressed: () {
                  _launchURL(_game);
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
                      image: new NetworkImage(_game.screenUrl()),
                    )),
              ),
            ),
            new Container(
                padding: new EdgeInsets.all(8.0),
                child: new Text(
                  _game.deck(),
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
    if (_game != null) {
      share(_game.siteDetailUrl());
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
