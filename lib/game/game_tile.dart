import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:game_freak/game/game.dart';
import 'package:game_freak/game/game_detail.dart';


class GameTile extends StatelessWidget {
  Game _game;

  GameTile(Game game) {
    _game = game;
  }

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      leading: new Image.network(_game.iconUrl()),
      title: new Text(_game.name()),
      onTap: () {
        Navigator.push(
          context,
          new MaterialPageRoute(builder: (context) => new GameDetailPage(_game)),
        );
      },
    );
  }
}