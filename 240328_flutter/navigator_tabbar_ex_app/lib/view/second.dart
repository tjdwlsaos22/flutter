import 'package:flutter/material.dart';

class secondPage extends StatelessWidget {
  const secondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.sunny, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // 뒤로 가기 동작을 수행합니다.
          },
        ),
      ),
      backgroundColor: Colors.black,
      body: const Center(
        child: CircleAvatar(
          backgroundImage: AssetImage('images/pika.png'),
          radius: 100,
        ),
      ),
    );
  }
}
