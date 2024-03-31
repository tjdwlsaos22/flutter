import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //property
  late String _lampImage; //image파일 이름
  late double _lampwidth; //image width
  late double _lampheight;
  late String _buttonName; //buton title
  late bool _switch; //switch 켜짐상태
  late String _lampSizeStatus; //현재화면의 lamp크기
  late double _rotation; // 회전각도

  @override
  void initState() {
    super.initState();
    _lampImage = 'images/lamp_on.png';
    _lampwidth = 150;
    _lampheight = 300;
    _buttonName = "Image 확대";
    _switch = true;
    _lampSizeStatus = 'small';
    _rotation = 0;

    Timer.periodic(const Duration(milliseconds: 5), (timer) {
      changeImage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Image 확대 및 축소')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                height: 580,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RotationTransition(
                      turns: AlwaysStoppedAnimation(_rotation / 360),
                      child: Image.asset(
                        _lampImage,
                        width: _lampwidth,
                        height: _lampheight,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () => decisionLampSize(),
                      child: Text(_buttonName)),
                  Column(
                    children: [
                      const Text(
                        '전구 스위치',
                        style: TextStyle(
                          fontSize: 10,
                        ),
                      ),
                      Switch(
                          value: _switch,
                          onChanged: (value) {
                            _switch = value;
                            decisionoff();
                          })
                    ],
                  )
                ],
              ),
              Container(
                color: Colors.amber,
                width: 200,
                child: Slider(
                  value: _rotation,
                  min: 0,
                  max: 360,
                  onChanged: (value) {
                    _rotation = value;
                    setState(() {});
                  },
                ),
              ),
            ],
          ),
        ));
  }

  decisionLampSize() {
    if (_lampSizeStatus == 'small') {
      _lampwidth = 250;
      _lampheight = 500;
      _buttonName = 'Image 축소';
      _lampSizeStatus = 'large';
    } else {
      _lampheight = 150;
      _lampheight = 300;
      _buttonName = 'Image 확대';
      _lampSizeStatus = 'small';
    }
    setState(() {});
  }

  decisionoff() {
    if (_switch) {
      _lampImage = 'images/lamp_on.png';
    } else {
      _lampImage = 'images/lamp_off.png';
    }
    setState(() {});
  }

  changeImage() {
    _rotation++;
    if (_rotation >= 360) {
      _rotation = 0;
      _lampImage = 'images/lamp_on.png';
    }
    if (_rotation >= 0 && _rotation < 180) {
      _switch = true; // 전구를 켜진 상태로 설정
    } else if (_rotation >= 180 && _rotation < 360) {
      if (_switch) {
        _switch = false; // 전구를 꺼진 상태로 설정
        _lampImage = 'images/lamp_off.png'; // 전구 이미지를 꺼진 상태 이미지로 변경
      }
    }
    setState(() {});
  }
}
