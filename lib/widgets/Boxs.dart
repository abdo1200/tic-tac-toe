import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictoc_app/main.dart';
import 'package:tictoc_app/provider/game_provider.dart';

class Box extends StatefulWidget {
  final int id;
  String content = '';
  bool click = true;
  Color color = Colors.white;

  Box(this.id);
  @override
  _BoxState createState() => _BoxState();
}

class _BoxState extends State<Box> {
  TextEditingController controller = new TextEditingController();

  Random ran = Random();

  @override
  Widget build(BuildContext context) {
    var game = Provider.of<GameProvider>(context);
    return GestureDetector(
      onTap: () async {
        if (game.oneplayer) {
          if (game.mode == 'easy') {
            if (widget.click) {
              widget.content = game.player;
              widget.color = brown;
              widget.click = false;
              game.index.remove(widget.id);
              await game.cLick();
              if (game.index.isNotEmpty) {
                int num = ran.nextInt(game.index.length);

                game.sizelistDynamic[game.index[num]].content = game.computer;
                game.sizelistDynamic[game.index[num]].color = pink;
                game.sizelistDynamic[game.index[num]].click = false;
                game.index.remove(game.index[num]);
              }

              await game.cLick();
              print(game.index);
              game.checkWinner(context);
              setState(() {});
            }
          } else {
            if (widget.click) {
              widget.content = game.player;
              widget.color = brown;
              widget.click = false;
              game.index.remove(widget.id);
              await game.cLick();
              if (game.index.isNotEmpty) {
                int num = ran.nextInt(game.index.length);
                if (game.index.length == 8 && game.index.contains(4)) {
                  int value = game.index.indexOf(4);
                  game.sizelistDynamic[game.index[value]].content =
                      game.computer;
                  game.sizelistDynamic[game.index[value]].color = pink;
                  game.sizelistDynamic[game.index[value]].click = false;
                  game.index.remove(4);
                } else if (game.index.length == 8 && game.index.contains(0)) {
                  game.sizelistDynamic[game.index[0]].content = game.computer;
                  game.sizelistDynamic[game.index[0]].color = pink;
                  game.sizelistDynamic[game.index[0]].click = false;
                  game.index.remove(0);
                } else {
                  await game.checkcomputerplace();
                  if (game.winplace != null) {
                    game.sizelistDynamic[game.winplace].content = game.computer;
                    game.sizelistDynamic[game.winplace].color = pink;
                    game.sizelistDynamic[game.winplace].click = false;
                    game.index.remove(game.winplace);
                  } else {
                    if (game.index.length == 6 && game.index.contains(2)) {
                      int value = game.index.indexOf(2);
                      game.sizelistDynamic[game.index[value]].content =
                          game.computer;
                      game.sizelistDynamic[game.index[value]].color = pink;
                      game.sizelistDynamic[game.index[value]].click = false;
                      game.index.remove(2);
                    } else if (game.index.length == 6 &&
                        game.index.contains(6)) {
                      int value = game.index.indexOf(6);
                      game.sizelistDynamic[game.index[value]].content =
                          game.computer;
                      game.sizelistDynamic[game.index[value]].color = pink;
                      game.sizelistDynamic[game.index[value]].click = false;
                      game.index.remove(6);
                    } else {
                      game.sizelistDynamic[game.index[num]].content =
                          game.computer;
                      game.sizelistDynamic[game.index[num]].color = pink;
                      game.sizelistDynamic[game.index[num]].click = false;
                      game.index.remove(game.index[num]);
                    }
                  }
                }
              }

              await game.cLick();
              print(game.index);
              game.winplace = null;
              game.checkWinner(context);
              setState(() {});
            }
          }
        } else if (game.twoplayer) {
          if (widget.click) {
            if (game.playertTurn) {
              widget.content = game.player;
              widget.color = brown;
              widget.click = false;
              game.index.remove(widget.id);
              game.cLick();
            } else {
              widget.content = game.computer;
              widget.color = pink;
              widget.click = false;
              game.index.remove(widget.id);
              game.cLick();
            }

            game.checkWinner(context);
            setState(() {});
          }
        }
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(2),
        width: 80,
        height: 80,
        decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(blurRadius: 2.5, color: Colors.black, spreadRadius: .5)
            ]),
        child: Text(
          widget.content,
          style: TextStyle(
              fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
