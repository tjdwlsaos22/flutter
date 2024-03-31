import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List imagesFile;
  late int currentPage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imagesFile = [
      'flower_01',
      'flower_02',
      'flower_03',
      'flower_04',
      'flower_05',
      'flower_06'
    ];

    currentPage = 0;

    //Timer 설치
    Timer.periodic(const Duration(seconds: 3), (timer) {
      changeImage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('3초마다 이미지 무한 반복'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${imagesFile[currentPage]}.png',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'images/${imagesFile[currentPage]}.png',
                  width: 400,
                ),
              )
            ],
          ),
        ));
  }

  changeImage() {
    currentPage++;
    if (currentPage >= imagesFile.length) {
      currentPage = 0;
    }
    setState(() {});
  }
}
