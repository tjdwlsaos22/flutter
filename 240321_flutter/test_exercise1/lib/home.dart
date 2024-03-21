import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Exercise 01'),
        centerTitle: false,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("유비"),
                SizedBox(
                  width: 10,
                ),
                Text("관우"),
                SizedBox(
                  width: 10,
                ),
                Text("장비"),
              ],
            ),
            //SizedBox(height: 30),
            Divider(
              height: 30,
              color: Colors.red,
              thickness: 2,
            ),
            Text(
              "조조",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 5),
            ),
            Text("여포"),
            Text("동탁")
          ],
        ),
      ),
    );
  }
}
