import 'package:flutter/material.dart';

class secondpage extends StatelessWidget {
  const secondpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('피카츄 이미지 탭바'),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          color: Colors.amber,
          child: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('images/pichu.png'),
                    radius: 70,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('images/pichu.png'),
                        radius: 70,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('images/pichu.png'),
                        radius: 70,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
