import 'package:flutter/material.dart';
import 'package:navigator_lamp_switch_app/message.dart';

class Edit extends StatefulWidget {
  const Edit({super.key});

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  late bool _switchValue1 = false;
  late bool _switchValue2 = false;
  late String imagepath;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _switchValue1 = Message.color;
    _switchValue2 = Message.on;
    imagepath = Message.imagepath;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("수정화면"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (!_switchValue1) // 스위치가 켜져 있지 않으면 레드 텍스트 표시
                Text('Red'),
              Switch(
                value: _switchValue1,
                onChanged: (value) {
                  setState(() {
                    _switchValue1 = value;
                    // 레드 스위치가 켜질 때 옐로우 텍스트를 보이게 함
                    if (_switchValue1) {
                      _switchValue2 = false; // OFF 스위치를 끔
                    }
                  });
                },
              ),
              if (_switchValue1) // 스위치가 켜져 있으면 옐로우 텍스트 표시
                Text('Yellow'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (!_switchValue2) // 스위치가 켜져 있지 않으면 레드 텍스트 표시
                Text('OFF'),
              Switch(
                value: _switchValue2,
                onChanged: (value) {
                  setState(() {
                    _switchValue2 = value;
                    // 레드 스위치가 켜질 때 옐로우 텍스트를 보이게 함
                    if (_switchValue2) {
                      _switchValue1 = false; // OFF 스위치를 끔
                    }
                  });
                },
              ),
              if (_switchValue2) // 스위치가 켜져 있으면 옐로우 텍스트 표시
                Text('ON'),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: () {
                _color();
              },
              child: const Text("OK"),
            ),
          ),
        ],
      ),
    );
  }

  _color() {
    if (_switchValue1 == false && _switchValue2 == false) {
      Message.imagepath = 'images/lamp_off.png';
    } else if (_switchValue1 == false && _switchValue2 == true) {
      Message.imagepath = "images/lamp_on.png";
    } else {
      Message.imagepath = "images/lamp_red.png";
    }

    // Navigate to the Edit page
    Navigator.pop(context);
  }
}
