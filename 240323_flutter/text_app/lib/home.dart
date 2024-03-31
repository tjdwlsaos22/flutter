import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('삼국지'),
        centerTitle: true,
        backgroundColor: Colors.amber,
        foregroundColor: Colors.green,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("유비"),
            SizedBox(
              height: 50,
            ),
            Text("관우"),
            Text("장비"),
          ],
        ),
      ),
    );
  }
}
