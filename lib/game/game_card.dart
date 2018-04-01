import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:game_freak/game/game.dart';
import 'package:game_freak/game/game_detail_page.dart';

class GameCard extends StatelessWidget {
  Game _game;

  GameCard(Game game) {
    _game = game;
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      child: new Card(
        child: new AspectRatio(
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
      ),
      onTap: () {
        Navigator.push(
          context,
          new MaterialPageRoute(builder: (context) => new GameDetailPage(_game)),
        );
      },
    );
  }
}
