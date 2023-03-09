import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 230, 99, 99),
        appBar: AppBar(
          title: const Text('ROLL THE DICE'),
          backgroundColor: const Color.fromARGB(255, 118, 46, 46),
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  var leftdicenumber = 1;
  var rightdicenumber = 1;
  var leftsum = 0;
  var rightsum = 0;
  var leftcount = 0;
  var rightcount = 0;
  var leftchancesleft = 10;
  var rightchancesleft = 10;
  String result = "";
  String notice = "GAME STARTS";
  bool leftgameover = true;
  bool rightgameover = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.yellow[100],
            ),
            onPressed: () {
              setState(() {
                leftdicenumber = 1;
                rightdicenumber = 1;
                rightsum = 0;
                leftsum = 0;
                leftcount = 0;
                rightcount = 0;
                leftchancesleft = 10;
                rightchancesleft = 10;
                result = "";
                notice = "GAME STARTS";
              });
            },
            child: const Text(
              "NEW GAME",
              style: TextStyle(
                fontFamily: 'Pacificio',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                letterSpacing: 1.5,
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const <Widget>[
              Text(
                "PLAYER 1",
                style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.5,
                ),
              ),
              Text(
                "PLAYER 2",
                style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: TextButton(
                  onPressed: () {
                    if (leftcount <= 10) {
                      setState(() {
                        leftdicenumber = Random().nextInt(6) + 1;
                      });
                    }

                    setState(() {
                      if (leftcount < 10) {
                        leftsum = leftsum + leftdicenumber;
                      }
                    });
                    setState(() {
                      if (leftcount < 10) {
                        leftcount = leftcount + 1;
                      } else {
                        if (leftchancesleft <= 0 && rightchancesleft <= 0) {
                          if (rightsum > leftsum) {
                            notice = "GAME OVER";
                            result = "PLAYER 2 WINS";
                          } else {
                            notice = "GAME OVER";
                            result = "PLAYER 1 WINS";
                          }
                        }
                      }
                      leftchancesleft = 10 - leftcount;
                    });
                  },
                  child: Image.asset('images/dice$leftdicenumber.png'),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    if (rightcount <= 10) {
                      setState(() {
                        rightdicenumber = Random().nextInt(6) + 1;
                      });
                    }
                    setState(() {
                      if (rightcount < 10) {
                        rightsum = rightsum + rightdicenumber;
                      }
                    });
                    setState(() {
                      if (rightcount < 10) {
                        rightcount = rightcount + 1;
                      } else {
                        if (leftchancesleft <= 0 && rightchancesleft <= 0) {
                          if (rightsum > leftsum) {
                            notice = "GAME OVER";
                            result = "PLAYER 2 WINS";
                          } else {
                              notice = "GAME OVER";
                            result = "PLAYER 1 WINS";
                          }
                        }
                      }
                      rightchancesleft = 10 - rightcount;
                    });
                  },
                  child: Image.asset('images/dice$rightdicenumber.png'),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const <Widget>[
              Text(
                "MY SCORE : ",
                style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.5,
                ),
              ),
              Text(
                "YOUR SCORE : ",
                style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                "$leftsum",
                style: const TextStyle(
                  fontFamily: 'SourceSansPro',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.5,
                ),
              ),
              Text(
                "$rightsum",
                style: const TextStyle(
                  fontFamily: 'SourceSansPro',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const <Widget>[
              Text(
                "CHANCES LEFT :",
                style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.5,
                ),
              ),
              Text(
                "CHANCES LEFT : ",
                style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                "$leftchancesleft",
                style: const TextStyle(
                  fontFamily: 'SourceSansPro',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.5,
                ),
              ),
              Text(
                "$rightchancesleft",
                style: const TextStyle(
                  fontFamily: 'SourceSansPro',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: Text(
              notice,
              style: const TextStyle(
                fontFamily: 'SourceSansPro',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.5,
              ),
            ),
          ),
          
          Expanded(
            child: Text(
              result,
              style: const TextStyle(
                fontFamily: 'SourceSansPro',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
