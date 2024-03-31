import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //property
  late String _lampImage; //image파일 이름
  late double _lampwidth; //image width
  late double _lampheight;

  @override
  void initState() {
    super.initState();
    _lampImage = 'images/lamp_on.png';
    _lampwidth = 150;
    _lampheight = 300;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Image 확대 및 축소')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                height: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      _lampImage,
                      width: _lampwidth,
                      height: _lampheight,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      ElevatedButton(
                          onPressed: () => clickAction(),
                          child: const Text("켜기"))
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                          onPressed: () => clickAction1(),
                          child: const Text("끄기"))
                    ],
                  )
                ],
              ),
            ],
          ),
        ));
  }

  clickAction() {
    if (_lampImage == 'images/lamp_on.png') {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('경고'),
            content: Text('현재 램프가 켜진 상태입니다'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // 대화 상자 닫기
                  // 여기에 켜기 동작 추가
                },
                child: Text('네,알겠습니다'),
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('경고'),
            content: Text('전구를 켜시겠습니까?'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // 대화 상자 닫기
                  _lampImage = 'images/lamp_on.png';
                  setState(() {});
                  // 여기에 켜기 동작 추가
                },
                child: Text('네'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // 대화 상자 닫기
                },
                child: Text('아니요'),
              ),
            ],
          );
        },
      );
    }
  }

  clickAction1() {
    if (_lampImage == 'images/lamp_off.png') {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('경고'),
            content: Text('현재 램프가 꺼진 상태입니다'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // 대화 상자 닫기
                  // 여기에 켜기 동작 추가
                },
                child: Text('네,알겠습니다'),
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('경고'),
            content: Text('전구를 끄시겠습니까?'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // 대화 상자 닫기
                  _lampImage = 'images/lamp_off.png';
                  setState(() {});
                  // 여기에 켜기 동작 추가
                },
                child: Text('네'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // 대화 상자 닫기
                },
                child: Text('아니요'),
              ),
            ],
          );
        },
      );
    }
  }
}
