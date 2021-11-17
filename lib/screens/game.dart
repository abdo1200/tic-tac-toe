import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictoc_app/main.dart';
import 'package:tictoc_app/provider/game_provider.dart';

import 'package:tictoc_app/widgets/custom_button.dart';
import 'package:flutter/services.dart';

class Game extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    var game = Provider.of<GameProvider>(context);
    print(game.oneplayer);
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/3.jpg'),
              repeat: ImageRepeat.repeat),
        ),
        padding: const EdgeInsets.all(20),
        child: Container(
          decoration: BoxDecoration(
              color: pink.withOpacity(.9),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: brown,
                  ),
                  onPressed: () async {
                    await game.restart();
                    Navigator.pop(context);
                  }),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Choose :',
                      style: TextStyle(
                          color: brown,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      game.choose('X', 'O');
                      await game.restart();
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      color: (game.player == 'X') ? brown : Colors.transparent,
                      child: Text(
                        'X',
                        style: TextStyle(
                            color: (game.player == 'X') ? Colors.white : brown,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      game.choose('O', 'X');
                      await game.restart();
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      color: (game.player == 'O') ? brown : Colors.transparent,
                      child: Text(
                        'O',
                        style: TextStyle(
                            color: (game.player == 'O') ? Colors.white : brown,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    color: (game.playertTurn) ? brown : Colors.transparent,
                    child: Text(
                      (game.oneplayer) ? 'Player' : 'Player 1',
                      style: TextStyle(
                          color: (game.playertTurn) ? Colors.white : brown,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    color: (game.playertTurn) ? Colors.transparent : brown,
                    child: Text(
                      (game.oneplayer) ? 'Computer ' : 'Player 2',
                      style: TextStyle(
                          color: (game.playertTurn) ? brown : Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 90,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  game.sizelistDynamic[0],
                  game.sizelistDynamic[1],
                  game.sizelistDynamic[2],
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  game.sizelistDynamic[3],
                  game.sizelistDynamic[4],
                  game.sizelistDynamic[5],
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  game.sizelistDynamic[6],
                  game.sizelistDynamic[7],
                  game.sizelistDynamic[8],
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    btncolor: Colors.white,
                    text: 'Restart',
                    textcolor: brown,
                    ontap: () {
                      game.restart();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
