import 'package:connection_view_label_app/model/message.dart';
import 'package:connection_view_label_app/view/detail.dart';
import 'package:connection_view_label_app/view/insert_page.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<String> heroList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    heroList = [
      '유비',
      '관우',
      '장비',
      '조조',
      '여포',
      '초선',
      '손견',
      '장양',
      '손책',
    ];
    Message.workList1 = heroList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('삼국지 인물'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.add), // 추가 아이콘
            onPressed: () {
              _next();
              // 추가 버튼을 눌렀을 때의 동작 추가
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: heroList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Message.workList = heroList[index];
                // 다음 페이지로 이동
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DetailList(),
                  ),
                );
              },
              child: Container(
                height: 50,
                color: Colors.greenAccent,
                child: Card(
                  color: Colors.yellow,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text(heroList[index])],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  _next() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const InsertPage()),
    ).then((value) {
      // next 함수가 완료된 후에 실행될 작업
      heroList.add(Message.workList);
      setState(() {});
    }).catchError((error) {
      print('에러: $error');
      // next 함수가 에러를 발생시킨 경우 실행될 작업
    });
    ;
  }
}
