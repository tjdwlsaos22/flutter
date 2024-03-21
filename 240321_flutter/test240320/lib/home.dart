import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: const Text('영웅 Card'),
        backgroundColor: const Color.fromARGB(255, 226, 145, 24),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('images/lee.png'),
                radius: 70,
              ),
            ),
            Divider(
              height: 20,
              color: Colors.black,
              thickness: 1,
              indent: 20, // 시작 부분에서의 공백
              endIndent: 20, // 끝 부분에서의 공백
            ),
            Row(
              children: [
                SizedBox(width: 20), // 텍스트 왼쪽 여백
                Text(
                  "성명",
                  style: TextStyle(color: Colors.white, letterSpacing: 3),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                SizedBox(width: 20), // 텍스트 왼쪽 여백
                Text(
                  "이순신 장군",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 20), // 텍스트 왼쪽 여백
                Text(
                  "전적",
                  style: TextStyle(color: Colors.white, letterSpacing: 3),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 20), // 텍스트 왼쪽 여백
                Text(
                  "62전 62승",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Icon(
                        Icons.check_circle_outline,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Icon(
                        Icons.check_circle_outline,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Icon(
                        Icons.check_circle_outline,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Icon(
                        Icons.check_circle_outline,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Icon(
                        Icons.check_circle_outline,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Icon(
                        Icons.check_circle_outline,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Icon(
                        Icons.check_circle_outline,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text('옥포해전'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text('사천포해전'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text('달포해전'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text('한산도대첩'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text('부산포해전'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text('명량해전'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text('노량해전'),
                    )
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('images/gu.gif'),
                radius: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
