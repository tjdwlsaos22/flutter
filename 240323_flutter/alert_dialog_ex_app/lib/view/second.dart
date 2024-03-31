import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        centerTitle: false,
        title: const Text('Second Page'),
      ),
      body: const Center(
        child: Text('2번째 페이지 입니다.'),
      ),
    );
  }
}