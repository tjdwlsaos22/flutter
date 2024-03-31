import 'package:flutter/material.dart';
import 'package:navigator_lamp_switch_app/edit.dart';
import 'package:navigator_lamp_switch_app/message.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String _image;

  @override
  void initState() {
    super.initState();
    _image = 'images/lamp_on.png'; // Set the initial image
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main 화면'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit), // 연필 아이콘
            onPressed: () {
              next();
            },
          ),
        ],
      ),
      body: Center(
        child: Image.asset(
          _image, // Use the _image variable here
          width: 200,
          height: 200,
        ),
      ),
    );
  }

  next() {
    // Update the Message variables based on the current image
    if (_image == 'images/lamp_on.png') {
      Message.on = true;
      Message.color = false;
    } else if (_image == 'images/lamp_off.png') {
      Message.on = false;
      Message.color = false;
    } else if (_image == 'images/lamp_red.png') {
      Message.on = false;
      Message.color = true;
    }

    // Navigate to the Edit page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Edit(),
      ),
    ).then((value) {
      // next 함수가 완료된 후에 실행될 작업
      _image = Message.imagepath;
      setState(() {});
    }).catchError((error) {
      print('에러: $error');
      // next 함수가 에러를 발생시킨 경우 실행될 작업
    });
    ;
  }
}
