import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictoc_app/main.dart';
import 'package:tictoc_app/provider/game_provider.dart';
import 'package:tictoc_app/screens/game.dart';
import 'package:tictoc_app/widgets/custom_button.dart';
import 'package:flutter/services.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    var game = Provider.of<GameProvider>(context);
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/3.jpg'),
              repeat: ImageRepeat.repeat),
        ),
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height / 2.5,
            width: MediaQuery.of(context).size.width / 1.5,
            decoration: BoxDecoration(
                color: pink.withOpacity(.9),
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  btncolor: Colors.white,
                  text: 'One player',
                  textcolor: brown,
                  ontap: () {
                    game.oneplayer = true;
                    game.twoplayer = false;
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: Text(
                          'Choose Mode',
                          style: TextStyle(
                              color: brown, fontWeight: FontWeight.bold),
                        ),
                        backgroundColor: pink,
                        actions: <Widget>[
                          CustomButton(
                            btncolor: brown,
                            text: 'Easy',
                            textcolor: Colors.white,
                            ontap: () {
                              game.mode = 'easy';
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Game()));
                            },
                          ),
                          CustomButton(
                            btncolor: Colors.brown,
                            text: 'Hard',
                            textcolor: Colors.white,
                            ontap: () {
                              game.mode = 'hard';
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Game()));
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                CustomButton(
                  btncolor: brown,
                  text: 'Two player',
                  textcolor: Colors.white,
                  ontap: () {
                    game.twoplayer = true;
                    game.oneplayer = false;
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Game()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
