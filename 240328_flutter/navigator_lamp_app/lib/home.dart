import 'package:flutter/material.dart';
import 'package:navigator_lamp_app/Message.dart';
import 'package:navigator_lamp_app/editpage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String _lampImage; // 이미지 파일 이름
  late bool _switch; // 스위치 켜짐 상태
  late TextEditingController nameController;

  @override
  void initState() {
    super.initState();
    _lampImage = 'images/lamp_on.png'; // 초기 이미지 설정
    _switch = true; // 초기 스위치 상태 설정
    nameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main 화면'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              _edit();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(15.0),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: '글자를 입력하세요',
                ),
                style: TextStyle(fontSize: 16),
                keyboardType: TextInputType.text,
                maxLines: 1,
              ),
            ),
            Image.asset(
              _lampImage,
              width: 150,
              height: 300,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // 스위치가 꺼진 경우 이미지를 꺼진 전구로 변경
  decisionOff() {
    if (_switch == false) {
      _lampImage = 'images/lamp_off.png';
    }
  }

  _edit() {
    Message.name = nameController.text;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Edit(),
      ),
    );
  }
}
