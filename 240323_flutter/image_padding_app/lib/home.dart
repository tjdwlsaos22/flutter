import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        title: const Text('Image Padding'),
        centerTitle: false,
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 100),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Image.asset('images/pichu.png', width: 150),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Image.asset('images/pika.png', width: 150),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Image.asset('images/rai.png', width: 150),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Image.asset('images/pichu.png', width: 150),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Image.asset('images/pika.png', width: 150),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Image.asset('images/rai.png', width: 150),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Image.asset('images/pichu.png', width: 150),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Image.asset('images/pichu.png', width: 150),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Image.asset('images/rai.png', width: 150),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Image.asset('images/pichu.png', width: 150),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Image.asset('images/pika.png', width: 150),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Image.asset('images/pichu.png', width: 150),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Image.asset('images/rai.png', width: 150),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Image.asset('images/pichu.png', width: 150),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Image.asset('images/pika.png', width: 150),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Image.asset('images/pichu.png', width: 150),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
