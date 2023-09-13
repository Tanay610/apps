import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tic_tac_toe/alert_dialog.dart';

class TestClass extends StatefulWidget {
  const TestClass({super.key});

  @override
  State<TestClass> createState() => _TestClassState();
}

class _TestClassState extends State<TestClass> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int scoreX = 0;
  int scoreO = 0;
  bool turnofO = true;
  int filledBoxes = 0;

  final List<String> xoroList = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue[900],
        actions: [
          IconButton(
              onPressed: () {
                _clearBoard();
              },
              icon: const Icon(Icons.refresh))
        ],
        title: const Text(
          "Tic Tac Toe",
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          _buildPointsTable(),
          _buildGrid(),
          _buildTurn(),
        ],
      ),
    );
  }

  Widget _buildPointsTable() {
    return Expanded(
      child: Container(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const Text(
                    'Player 0',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    scoreO.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const Text(
                    'Player X',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    scoreX.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGrid() {
    return Expanded(
      flex: 3,
      child: GridView.builder(
        itemCount: 9,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              tapped(index);
            },
            child: Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.white)),
              child: Center(
                child: Text(
                  xoroList[index],
                  style: TextStyle(
                    color: xoroList[index] == 'x' ? Colors.white : Colors.red,
                    fontSize: 40,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTurn() {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Text(
            turnofO ? 'Turn of 0' : 'Turn of X',
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  void tapped(int index) {
    setState(() {
      if (turnofO && xoroList[index] == '') {
        xoroList[index] = 'O';
        filledBoxes += 1;
      } else if (!turnofO && xoroList[index] == '') {
        xoroList[index] = 'x';
        filledBoxes += 1;
      }

      turnofO = !turnofO;
      checkTheWinner();
    });
  }

  void checkTheWinner() {
    // check first row
    if (xoroList[0] == xoroList[1] &&
        xoroList[0] == xoroList[2] &&
        xoroList[0] != '') {
      _showAlertDialog('Winner', xoroList[0]);
      return;
    }

    // check second row
    if (xoroList[3] == xoroList[4] &&
        xoroList[3] == xoroList[5] &&
        xoroList[3] != '') {
      _showAlertDialog('Winner', xoroList[3]);
      return;
    }

    // check third row
    if (xoroList[6] == xoroList[1] &&
        xoroList[6] == xoroList[2] &&
        xoroList[6] != '') {
      _showAlertDialog('Winner', xoroList[6]);
      return;
    }

    // check first column
    if (xoroList[0] == xoroList[3] &&
        xoroList[0] == xoroList[6] &&
        xoroList[0] != '') {
      _showAlertDialog('Winner', xoroList[0]);
      return;
    }

    // check second column
    if (xoroList[1] == xoroList[4] &&
        xoroList[1] == xoroList[7] &&
        xoroList[1] != '') {
      _showAlertDialog('Winner', xoroList[1]);
      return;
    }

    // check third column
    if (xoroList[2] == xoroList[5] &&
        xoroList[2] == xoroList[8] &&
        xoroList[2] != '') {
      _showAlertDialog('Winner', xoroList[2]);
      return;
    }

    // check diagonal
    if (xoroList[0] == xoroList[4] &&
        xoroList[0] == xoroList[8] &&
        xoroList[0] != '') {
      _showAlertDialog('Winner', xoroList[0]);
      return;
    }

    // check diagonal
    if (xoroList[2] == xoroList[4] &&
        xoroList[2] == xoroList[6] &&
        xoroList[2] != '') {
      _showAlertDialog("Winner", xoroList[2]);
      return;
    }

    if (filledBoxes == 9) {
      _showAlertDialog("Draw", '');
    }
  }

  void _showAlertDialog(String title, String winner) {
    showAlertDialog(
        context: context,
        title: title,
        content: winner == ''
            ? 'The match ended in a draw'
            : 'The winner is ${winner.toUpperCase()}',
        defaultActionText: 'OK',
        onOkPressed: () {
          _clearBoard();
          Navigator.of(context).pop();
        });

    if (winner == 'O') {
      scoreO += 1;
    } else if (winner == 'x') {
      scoreX += 1;
    }
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        xoroList[i] = '';
      }
    });

    filledBoxes = 0;
  }
}
