import 'package:flutter/material.dart';
import 'package:tictoc_app/main.dart';
import 'package:tictoc_app/screens/home.dart';
import 'package:tictoc_app/widgets/Boxs.dart';
import 'package:tictoc_app/widgets/custom_button.dart';

class GameProvider extends ChangeNotifier {
  bool playertTurn = true;
  String player = 'X';
  String computer = 'O';
  String mode;
  List index = [0, 1, 2, 3, 4, 5, 6, 7, 8];
  bool oneplayer = false;
  bool twoplayer = false;
  List<Box> sizelistDynamic = [
    new Box(0),
    new Box(1),
    new Box(2),
    new Box(3),
    new Box(4),
    new Box(5),
    new Box(6),
    new Box(7),
    new Box(8),
  ];
  int winplace;
  choose(playerchoose, computerchoose) {
    player = playerchoose;
    computer = computerchoose;

    notifyListeners();
  }

  cLick() {
    playertTurn = !playertTurn;
    notifyListeners();
  }

  restart() {
    sizelistDynamic.forEach((element) {
      element.content = '';
      element.color = Colors.white;
      element.click = true;
    });
    playertTurn = true;
    index = [0, 1, 2, 3, 4, 5, 6, 7, 8];
    notifyListeners();
  }

  disable() {
    index.forEach((element) {
      sizelistDynamic[element].click = false;
      sizelistDynamic[element].color = Colors.grey;
    });
    notifyListeners();
  }

  checkWinner(context) {
    List content = ['', '', '', '', '', '', '', '', ''];
    sizelistDynamic.forEach((element) {
      content[element.id] = element.content;
    });

    if (content[0] == player && content[1] == player && content[2] == player ||
        content[3] == player && content[4] == player && content[5] == player ||
        content[6] == player && content[7] == player && content[8] == player ||
        content[0] == player && content[3] == player && content[6] == player ||
        content[1] == player && content[4] == player && content[7] == player ||
        content[2] == player && content[5] == player && content[8] == player ||
        content[0] == player && content[4] == player && content[8] == player ||
        content[2] == player && content[4] == player && content[6] == player) {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          backgroundColor: pink,
          title: Text((oneplayer) ? 'PLayer Win' : 'Player 1 win'),
          content: Image.asset('assets/images/winner.png'),
          actions: <Widget>[
            CustomButton(
              btncolor: brown,
              text: 'Restart',
              textcolor: Colors.white,
              ontap: () {
                restart();
                content = ['', '', '', '', '', '', '', '', ''];
                Navigator.of(context).pop();
              },
            ),
            CustomButton(
              btncolor: brown,
              text: 'Back',
              textcolor: Colors.white,
              ontap: () async {
                await restart();
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
            ),
          ],
        ),
      );

      disable();
    } else if (content[0] == computer &&
            content[1] == computer &&
            content[2] == computer ||
        content[3] == computer &&
            content[4] == computer &&
            content[5] == computer ||
        content[6] == computer &&
            content[7] == computer &&
            content[8] == computer ||
        content[0] == computer &&
            content[3] == computer &&
            content[6] == computer ||
        content[1] == computer &&
            content[4] == computer &&
            content[7] == computer ||
        content[2] == computer &&
            content[5] == computer &&
            content[8] == computer ||
        content[0] == computer &&
            content[4] == computer &&
            content[8] == computer ||
        content[2] == computer &&
            content[4] == computer &&
            content[6] == computer) {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          backgroundColor: pink,
          title: Text((oneplayer) ? 'Computer Win' : 'player 2 win'),
          content: Image.asset('assets/images/winner.png'),
          actions: <Widget>[
            CustomButton(
              btncolor: brown,
              text: 'Restart',
              textcolor: Colors.white,
              ontap: () async {
                await restart();
                content = ['', '', '', '', '', '', '', '', ''];
                Navigator.of(context).pop();
              },
            ),
            CustomButton(
              btncolor: brown,
              text: 'Back',
              textcolor: Colors.white,
              ontap: () async {
                await restart();
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
            ),
          ],
        ),
      );
      disable();
    } else if (index.isEmpty) {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          backgroundColor: pink,
          title: const Text('Draw'),
          actions: <Widget>[
            CustomButton(
              btncolor: brown,
              text: 'Restart',
              textcolor: Colors.white,
              ontap: () {
                restart();
                content = ['', '', '', '', '', '', '', '', ''];
                Navigator.of(context).pop();
              },
            ),
            CustomButton(
              btncolor: brown,
              text: 'Back',
              textcolor: Colors.white,
              ontap: () async {
                await restart();
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
            ),
          ],
        ),
      );
    }
    notifyListeners();
  }

  checkcomputerplace() async {
    List content = ['', '', '', '', '', '', '', '', ''];
    sizelistDynamic.forEach((element) {
      content[element.id] = element.content;
    });
    if (content[0] == computer && content[1] == computer && content[2] == '') {
      winplace = 2;
    } else if (content[0] == computer &&
        content[2] == computer &&
        content[1] == '') {
      winplace = 1;
    } else if (content[1] == computer &&
        content[2] == computer &&
        content[0] == '') {
      winplace = 0;
    } else if (content[3] == computer &&
        content[4] == computer &&
        content[5] == '') {
      winplace = 5;
    } else if (content[3] == computer &&
        content[5] == computer &&
        content[4] == '') {
      winplace = 4;
    } else if (content[4] == computer &&
        content[5] == computer &&
        content[3] == '') {
      winplace = 3;
    } else if (content[6] == computer &&
        content[7] == computer &&
        content[8] == '') {
      winplace = 8;
    } else if (content[8] == computer &&
        content[7] == computer &&
        content[6] == '') {
      winplace = 6;
    } else if (content[6] == computer &&
        content[8] == computer &&
        content[7] == '') {
      winplace = 7;
    } else if (content[0] == computer &&
        content[3] == computer &&
        content[6] == '') {
      winplace = 6;
    } else if (content[0] == computer &&
        content[6] == computer &&
        content[3] == '') {
      winplace = 3;
    } else if (content[3] == computer &&
        content[6] == computer &&
        content[0] == '') {
      winplace = 0;
    } else if (content[1] == computer &&
        content[4] == computer &&
        content[7] == '') {
      winplace = 7;
    } else if (content[7] == computer &&
        content[4] == computer &&
        content[1] == '') {
      winplace = 1;
    } else if (content[1] == computer &&
        content[7] == computer &&
        content[4] == '') {
      winplace = 4;
    } else if (content[2] == computer &&
        content[5] == computer &&
        content[8] == '') {
      winplace = 8;
    } else if (content[8] == computer &&
        content[5] == computer &&
        content[2] == '') {
      winplace = 2;
    } else if (content[2] == computer &&
        content[8] == computer &&
        content[5] == '') {
      winplace = 5;
    } else if (content[0] == computer &&
        content[4] == computer &&
        content[8] == '') {
      winplace = 8;
    } else if (content[8] == computer &&
        content[4] == computer &&
        content[0] == '') {
      winplace = 0;
    } else if (content[0] == computer &&
        content[8] == computer &&
        content[4] == '') {
      winplace = 4;
    } else if (content[2] == computer &&
        content[4] == computer &&
        content[6] == '') {
      winplace = 6;
    } else if (content[2] == computer &&
        content[6] == computer &&
        content[4] == '') {
      winplace = 4;
    } else if (content[6] == computer &&
        content[4] == computer &&
        content[2] == '') {
      winplace = 2;
    } else {
      await checkWinnerplace();
    }

    print(winplace);
    notifyListeners();
  }

  checkWinnerplace() {
    List content = ['', '', '', '', '', '', '', '', ''];
    sizelistDynamic.forEach((element) {
      content[element.id] = element.content;
    });

    if (content[0] == player && content[1] == player && content[2] == '') {
      winplace = 2;
    } else if (content[0] == player &&
        content[2] == player &&
        content[1] == '') {
      winplace = 1;
    } else if (content[1] == player &&
        content[2] == player &&
        content[0] == '') {
      winplace = 0;
    } else if (content[3] == player &&
        content[4] == player &&
        content[5] == '') {
      winplace = 5;
    } else if (content[3] == player &&
        content[5] == player &&
        content[4] == '') {
      winplace = 4;
    } else if (content[4] == player &&
        content[5] == player &&
        content[3] == '') {
      winplace = 3;
    } else if (content[6] == player &&
        content[7] == player &&
        content[8] == '') {
      winplace = 8;
    } else if (content[8] == player &&
        content[7] == player &&
        content[6] == '') {
      winplace = 6;
    } else if (content[6] == player &&
        content[8] == player &&
        content[7] == '') {
      winplace = 7;
    } else if (content[0] == player &&
        content[3] == player &&
        content[6] == '') {
      winplace = 6;
    } else if (content[0] == player &&
        content[6] == player &&
        content[3] == '') {
      winplace = 3;
    } else if (content[3] == player &&
        content[6] == player &&
        content[0] == '') {
      winplace = 0;
    } else if (content[1] == player &&
        content[4] == player &&
        content[7] == '') {
      winplace = 7;
    } else if (content[7] == player &&
        content[4] == player &&
        content[1] == '') {
      winplace = 1;
    } else if (content[1] == player &&
        content[7] == player &&
        content[4] == '') {
      winplace = 4;
    } else if (content[2] == player &&
        content[5] == player &&
        content[8] == '') {
      winplace = 8;
    } else if (content[8] == player &&
        content[5] == player &&
        content[2] == '') {
      winplace = 2;
    } else if (content[2] == player &&
        content[8] == player &&
        content[5] == '') {
      winplace = 5;
    } else if (content[0] == player &&
        content[4] == player &&
        content[8] == '') {
      winplace = 8;
    } else if (content[8] == player &&
        content[4] == player &&
        content[0] == '') {
      winplace = 0;
    } else if (content[0] == player &&
        content[8] == player &&
        content[4] == '') {
      winplace = 4;
    } else if (content[2] == player &&
        content[4] == player &&
        content[6] == '') {
      winplace = 6;
    } else if (content[2] == player &&
        content[6] == player &&
        content[4] == '') {
      winplace = 4;
    } else if (content[6] == player &&
        content[4] == player &&
        content[2] == '') {
      winplace = 2;
    }
    print(winplace);
    notifyListeners();
  }
}
