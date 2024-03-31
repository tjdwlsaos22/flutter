import 'dart:async';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List str;
  late int currentCharacter;
  late String character;

  @override
  void initState() {
    super.initState();
    String data = '대한민국';
    str = data.split('');
    currentCharacter = 0;
    character = str[currentCharacter];

    // Timer 설정
    Timer.periodic(const Duration(seconds: 3), (timer) {
      changeText();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('3초마다 텍스트 누적'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              character,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void changeText() {
    currentCharacter++;
    if (currentCharacter >= str.length) {
      currentCharacter = 0;
      character = str[currentCharacter];
    } else {
      character += str[currentCharacter];
    }
    setState(() {});
  }
}
