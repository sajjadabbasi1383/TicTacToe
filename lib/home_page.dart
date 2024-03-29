import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const myTextStyle = TextStyle(
    fontSize: 18,
    color: Colors.white,
    fontFamily: 'PressStart2P',
    letterSpacing: 2,
  );
  static const myTextStyle3 = TextStyle(
    fontSize: 30,
    color: Colors.white,
    fontFamily: 'PressStart2P',
  );
  static const myTextStyle2 = TextStyle(
    fontSize: 15,
    color: Colors.black,
    fontFamily: 'PressStart2P',
    letterSpacing: 2,
  );

  bool ohTurn = true;
  bool winner = false;
  List<String> displayExOh = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  int ohScore = 0;
  int exScore = 0;
  int filledBoxes = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey[850],
      body: Column(
        children: [
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Player O",
                    style: myTextStyle,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    ohScore.toString(),
                    style: myTextStyle,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Player X",
                    style: myTextStyle,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    exScore.toString(),
                    style: myTextStyle,
                  ),
                ],
              ),
            ],
          )),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      _tapped(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey[700]!,
                        ),
                      ),
                      child: Center(
                        child: Text(displayExOh[index],
                            //index.toString(),
                            style: myTextStyle3),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "TIC TAC TOE",
                style: myTextStyle,
              ),
              GestureDetector(
                onTap: () {
                  _resetScore();
                },
                child: Container(
                  padding: const EdgeInsets.all(25),
                  margin: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Text(
                      "RESET SCORE",
                      style: myTextStyle2,
                    ),
                  ),
                ),
              )
            ],
          ))
        ],
      ),
    ));
  }

  void _tapped(int index) {
    setState(() {
      if (ohTurn && displayExOh[index] == '') {
        displayExOh[index] = 'o';
        filledBoxes += 1;
      } else if (!ohTurn && displayExOh[index] == '') {
        displayExOh[index] = 'x';
        filledBoxes += 1;
      }
      ohTurn = !ohTurn;
      _checkWinner();
    });
  }

  void _checkWinner() {
    //check 1st row
    if (displayExOh[0] == displayExOh[1] &&
        displayExOh[0] == displayExOh[2] &&
        displayExOh[0] != '') {
      if (filledBoxes == 9) {
        winner = true;
      }
      _showWinDialog(displayExOh[0]);
    }

    //check 2st row
    if (displayExOh[3] == displayExOh[4] &&
        displayExOh[3] == displayExOh[5] &&
        displayExOh[3] != '') {
      if (filledBoxes == 9) {
        winner = true;
      }
      _showWinDialog(displayExOh[3]);
    }

    //check 3st row
    if (displayExOh[6] == displayExOh[7] &&
        displayExOh[6] == displayExOh[8] &&
        displayExOh[6] != '') {
      if (filledBoxes == 9) {
        winner = true;
      }
      _showWinDialog(displayExOh[6]);
    }

    //check 1st column
    if (displayExOh[0] == displayExOh[3] &&
        displayExOh[0] == displayExOh[6] &&
        displayExOh[0] != '') {
      if (filledBoxes == 9) {
        winner = true;
      }
      _showWinDialog(displayExOh[0]);
    }

    //check 2st column
    if (displayExOh[1] == displayExOh[4] &&
        displayExOh[1] == displayExOh[7] &&
        displayExOh[1] != '') {
      if (filledBoxes == 9) {
        winner = true;
      }
      _showWinDialog(displayExOh[1]);
    }

    //check 3st column
    if (displayExOh[2] == displayExOh[5] &&
        displayExOh[2] == displayExOh[8] &&
        displayExOh[2] != '') {
      if (filledBoxes == 9) {
        winner = true;
      }
      _showWinDialog(displayExOh[2]);
    }

    //check diagonal
    if (displayExOh[0] == displayExOh[4] &&
        displayExOh[0] == displayExOh[8] &&
        displayExOh[0] != '') {
      if (filledBoxes == 9) {
        winner = true;
      }
      _showWinDialog(displayExOh[0]);
    }

    //check diagonal
    if (displayExOh[2] == displayExOh[4] &&
        displayExOh[2] == displayExOh[6] &&
        displayExOh[2] != '') {
      if (filledBoxes == 9) {
        winner = true;
      }
      _showWinDialog(displayExOh[2]);
    }

    if (winner == false && filledBoxes == 9) {
      _showDrawDialog();
    }
  }

  void _showWinDialog(String winner) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey[100],
          title: Text(
            'Winner is : $winner',
            style: const TextStyle(
              fontFamily: 'PressStart2P',
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  _clearBoard();
                  Navigator.pop(context);
                },
                child: Text(
                  "Play Again!",
                  style: TextStyle(
                    color: Colors.grey[900],
                    fontFamily: 'PressStart2P',
                  ),
                ))
          ],
        );
      },
    );
    if (winner == 'o') {
      ohScore += 1;
    } else if (winner == 'x') {
      exScore += 1;
    }
  }

  void _showDrawDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey[100],
          title: const Text(
            'Draw!',
            style: TextStyle(
              fontFamily: 'PressStart2P',
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  _clearBoard();
                  Navigator.pop(context);
                },
                child: Text(
                  "Play Again!",
                  style: TextStyle(
                      fontFamily: 'PressStart2P', color: Colors.grey[900]),
                ))
          ],
        );
      },
    );
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayExOh[i] = '';
      }
    });
    filledBoxes = 0;
    winner = false;
  }

  void _resetScore() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayExOh[i] = '';
      }
      filledBoxes = 0;
      winner = false;
      ohScore = 0;
      exScore = 0;
    });
  }
}
