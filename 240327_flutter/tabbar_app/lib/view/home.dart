import 'package:flutter/material.dart';
import 'package:tabbar_app/view/first_page.dart';
import 'package:tabbar_app/view/second_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  //property
  late TabController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Tab Bar Test'),
      //   backgroundColor: Colors.blue,
      //   foregroundColor: Colors.white,
      // ),
      body: TabBarView(
        controller: controller,
        children: const [
          FirstPage(),
          secondpage(),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        height: 80,
        child: TabBar(
          controller: controller,
          labelColor: Colors.blue,
          indicatorColor: Colors.red,
          indicatorWeight: 5,
          tabs: [
            Tab(
              icon: Image.asset(
                //이미지 넣을땐 이렇게 아이콘 옆에 넣으면됨
                'images/pichu.png',
                width: 30,
                height: 30,
              ),
              text: "One",
            ),
            Tab(
              icon: Image.asset(
                'images/pika.png',
                width: 30,
                height: 30,
              ),
              //Icon(Icons.looks_two),
              text: "Two",
            )
          ],
        ),
      ),
    );
  }
}
