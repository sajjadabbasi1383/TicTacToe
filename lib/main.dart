import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const myTextStyle = TextStyle(fontSize: 25, color: Colors.white);

  bool ohTurn = true;
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey[800],
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
                        child: Text(
                          displayExOh[index],
                          //index.toString(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 50),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(child: Container())
        ],
      ),
    ));
  }

  void _tapped(int index) {
    setState(() {
      if (ohTurn) {
        displayExOh[index] = 'o';
      } else {
        displayExOh[index] = 'x';
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
      _showDialog(displayExOh[0]);
    }

    //check 2st row
    if (displayExOh[3] == displayExOh[4] &&
        displayExOh[3] == displayExOh[5] &&
        displayExOh[3] != '') {
      _showDialog(displayExOh[3]);
    }

    //check 3st row
    if (displayExOh[6] == displayExOh[7] &&
        displayExOh[6] == displayExOh[8] &&
        displayExOh[6] != '') {
      _showDialog(displayExOh[6]);
    }

    //check 1st column
    if (displayExOh[0] == displayExOh[3] &&
        displayExOh[0] == displayExOh[6] &&
        displayExOh[0] != '') {
      _showDialog(displayExOh[0]);
    }

    //check 2st column
    if (displayExOh[1] == displayExOh[4] &&
        displayExOh[1] == displayExOh[7] &&
        displayExOh[1] != '') {
      _showDialog(displayExOh[1]);
    }

    //check 3st column
    if (displayExOh[2] == displayExOh[5] &&
        displayExOh[2] == displayExOh[8] &&
        displayExOh[2] != '') {
      _showDialog(displayExOh[2]);
    }

    //check diagonal
    if (displayExOh[0] == displayExOh[4] &&
        displayExOh[0] == displayExOh[8] &&
        displayExOh[0] != '') {
      _showDialog(displayExOh[0]);
    }

    //check diagonal
    if (displayExOh[2] == displayExOh[4] &&
        displayExOh[2] == displayExOh[6] &&
        displayExOh[2] != '') {
      _showDialog(displayExOh[2]);
    }
  }

  void _showDialog(String winner) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Winner is : $winner'),
        );
      },
    );
    if(winner=='o'){

    }else if(winner=='x'){

    }
  }
}
