import 'package:flutter/material.dart';
import 'package:webview_tabbar_ex_app/web_body.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController controller;
  late List siteName;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
    siteName = ['www.naver.com', 'www.google.com', 'www.daum.net'];
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebView - Tabbar'),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          WebBody(siteName: siteName[0]),
          WebBody(siteName: siteName[1]),
          WebBody(siteName: siteName[2]),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 100,
        child: TabBar(labelColor: Colors.lightBlue, tabs: [
          Tab(
              icon: Image.asset(
                'images/naver.png',
                width: 30,
                height: 30,
              ),
              text: '네이버'),
          Tab(
              icon: Image.asset(
                'images/google.png',
                width: 30,
                height: 30,
              ),
              text: '구글'),
          Tab(
              icon: Image.asset(
                'images/daum.png',
                width: 30,
                height: 30,
              ),
              text: '다음'),
        ]),
      ),
    );
  }
}
