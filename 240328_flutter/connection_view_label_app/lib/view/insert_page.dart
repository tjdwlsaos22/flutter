import 'package:connection_view_label_app/model/message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InsertPage extends StatefulWidget {
  const InsertPage({super.key});

  @override
  State<InsertPage> createState() => _InsertPageState();
}

class _InsertPageState extends State<InsertPage> {
  late TextEditingController textEditingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('인물 추가'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                controller: textEditingController,
                decoration: const InputDecoration(
                  labelText: '인물을 추가하세요', // 라벨 텍스트
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                addList();
              },
              child: Text('추가'),
            ),
          ],
        ),
      ),
    );
  }

  addList() {
    Message.workList = textEditingController.text;
    Message.action = true;
    setState(() {});
    Navigator.pop(context);
  }
}
