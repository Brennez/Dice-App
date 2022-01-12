import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: DiceApp(),
    );
  }
}

class DiceApp extends StatefulWidget {
  const DiceApp({Key? key}) : super(key: key);

  @override
  _DiceAppState createState() => _DiceAppState();
}

class _DiceAppState extends State<DiceApp> {
  int numberRight = 1;
  int numberLeft = 1;
  bool isDark = false;

  Color primaryColor = Colors.red;
  Color secondaryColor = Colors.grey.shade900;
  // Caso de uso 1:  usando um clique no botão e mudando os dois
  void changeDiceNumber() {
    var random = Random();
    setState(() {
      numberRight = random.nextInt(6) + 1;
      numberLeft = random.nextInt(6) + 1;
    });
  }

  //Caso de uso 2: Usando um clique em cada dado pra gerar os valores
  int ChangeDiceNumber2() {
    Random random = Random();
    int number = random.nextInt(6) + 1;
    return number;
  }

  changeMode() {
    if (isDark) {
      isDark = false;
    } else {
      isDark = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDark ? secondaryColor : primaryColor,
      appBar: AppBar(
        title: const Text("DiceApp"),
        centerTitle: true,
        backgroundColor: isDark ? secondaryColor : primaryColor,
        actions: [
          IconButton(
            onPressed: () {
              changeMode();
              setState(() {});
            },
            icon: const Icon(Icons.dark_mode),
          )
        ],
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  numberLeft = ChangeDiceNumber2();
                });
              },
              icon: Image.asset(
                "assets/images/dice$numberLeft.png",
              ),
              iconSize: 100,
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  numberRight = ChangeDiceNumber2();
                });
              },
              icon: Image.asset(
                "assets/images/dice$numberRight.png",
              ),
              iconSize: 100,
            ),
          ],
        ),
      ),
    );
  }
}
