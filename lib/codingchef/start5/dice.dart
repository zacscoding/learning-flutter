import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dice extends StatefulWidget {
  const Dice({Key? key}) : super(key: key);

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  @override
  Widget build(BuildContext context) {
    int leftDice = 1;
    int rightDice = 1;

    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text('Dice game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Image.asset('assets/start5/dice$leftDice.png'),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: Image.asset('assets/start5/dice$rightDice.png'),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 60.0,
            ),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  leftDice = Random().nextInt(6) + 1;
                  rightDice = Random().nextInt(6) + 1;
                  print('left: $leftDice, right: $rightDice');
                });
              },
              icon: const Icon(
                Icons.play_arrow,
                size: 50.0,
              ),
              label: const Text('Play'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.orangeAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
