import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TicTacToe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'TicTacToe'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool xTurn = true;
  bool gameEnded = false;
  var buttonText = <String>["", "", "", "", "", "", "", "", ""];

  SizedBox getButton(int i) {
    return SizedBox(
        height: 120,
        width: 120,
        child: TextButton(
          onPressed: () {
            setState(() {
              if (buttonText[i] == '' && !gameEnded) {
                xTurn = !xTurn;
                buttonText[i] = xTurn ? 'x' : 'o';
              }
            });
            checkWinCondition();
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  Color.fromARGB(255, 67, 63, 63))),
          child: Text(buttonText[i], style: TextStyle(fontSize: 100)),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              getButton(0),
              getButton(1),
              getButton(2),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              getButton(3),
              getButton(4),
              getButton(5),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              getButton(6),
              getButton(7),
              getButton(8),
            ],
          ),
          const SizedBox(
            width: 50,
            height: 50,
          ),
          Center(
            child: Text(checkWinCondition()),
          ),
          const SizedBox(
            width: 50,
            height: 50,
          ),
          ElevatedButton(
            onPressed: () => {
              gameEnded = false,
              setState(() {
                for (int j = 0; j < buttonText.length; j++) {
                  buttonText[j] = "";
                }
              })
            },
            child: Text("RESET"),
          )
        ],
      )),
    );
  }

  String checkWinCondition() {
    if (buttonText[0] != '' &&
        buttonText[0] == buttonText[1] &&
        buttonText[0] == buttonText[2]) {
      gameEnded = true;
      xTurn = true;
      return "${buttonText[0]} gewinnt!";
    } else if (buttonText[3] != '' &&
        buttonText[3] == buttonText[4] &&
        buttonText[3] == buttonText[5]) {
      gameEnded = true;
      xTurn = true;
      return "${buttonText[3]} gewinnt!";
    } else if (buttonText[6] != '' &&
        buttonText[6] == buttonText[7] &&
        buttonText[6] == buttonText[8]) {
      gameEnded = true;
      xTurn = true;
      return "${buttonText[6]} gewinnt!";
    } else if (buttonText[0] != '' &&
        buttonText[0] == buttonText[3] &&
        buttonText[0] == buttonText[6]) {
      gameEnded = true;
      xTurn = true;
      return "${buttonText[0]} gewinnt!";
    } else if (buttonText[1] != '' &&
        buttonText[1] == buttonText[4] &&
        buttonText[1] == buttonText[7]) {
      gameEnded = true;
      xTurn = true;
      return "${buttonText[1]} gewinnt!";
    } else if (buttonText[2] != '' &&
        buttonText[2] == buttonText[5] &&
        buttonText[2] == buttonText[8]) {
      gameEnded = true;
      xTurn = true;
      return "${buttonText[2]} gewinnt!";
    } else if (buttonText[0] != '' &&
        buttonText[0] == buttonText[4] &&
        buttonText[0] == buttonText[8]) {
      gameEnded = true;
      xTurn = true;
      return "${buttonText[0]} gewinnt!";
    } else if (buttonText[2] != '' &&
        buttonText[2] == buttonText[4] &&
        buttonText[2] == buttonText[6]) {
      gameEnded = true;
      xTurn = true;
      return "${buttonText[2]} gewinnt!";
    } else if (buttonText[0] != "" &&
        buttonText[1] != "" &&
        buttonText[2] != "" &&
        buttonText[3] != "" &&
        buttonText[4] != "" &&
        buttonText[5] != "" &&
        buttonText[6] != "" &&
        buttonText[7] != "" &&
        buttonText[8] != "") {
      gameEnded = true;
      xTurn = true;
      return "Keiner hat gewonnen.";
    } else
      return "";
  }
}
