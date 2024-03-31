import 'package:flutter/material.dart';
import 'package:navigator_app/view/first_page.dart';

class thirdpage extends StatelessWidget {
  const thirdpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('third page')),
      body: Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.popUntil(
                  context,
                  ModalRoute.withName('/'), // 루트 페이지까지 팝합니다.
                );
              },
              child: const Text('go to the first page'))),
    );
  }
}
