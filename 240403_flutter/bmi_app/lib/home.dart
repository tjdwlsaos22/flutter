import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController num1Controller;
  late TextEditingController num2Controller;
  late String textToShow = '';
  double height = 160; // 초기 신장 설정
  double weight = 60; // 초기 몸무게 설정
  double bmiValue = 0; // BMI 값

  @override
  void initState() {
    super.initState();
    num1Controller = TextEditingController();
    num2Controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('BMI 구하기'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: CupertinoPicker(
                      itemExtent: 30,
                      onSelectedItemChanged: (int index) {
                        setState(() {
                          height = 100 + index.toDouble();
                          updateBMI();
                        });
                      },
                      children: List.generate(
                        100,
                        (index) => Center(child: Text('${100 + index} cm')),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: CupertinoPicker(
                      itemExtent: 30,
                      onSelectedItemChanged: (int index) {
                        setState(() {
                          weight = 30 + index.toDouble();
                          updateBMI();
                        });
                      },
                      children: List.generate(
                        100,
                        (index) => Center(child: Text('${30 + index} kg')),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Text(
                textToShow,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // BMI에 따른 화살표 이미지 표시
                  if (bmiValue <= 18.4)
              Stack(
                children: [
                  Image.asset(
                    'images/bmi.jpg', // 이미지 경로
                    width: 300, // 이미지 가로 길이
                    height: 300, // 이미지 세로 길이
                  ),
                  Positioned(
                    top: 0,
                    left: 10,
                    child: Icon(
                      Icons.arrow_downward, // 화살표 아이콘
                      color: Colors.red, // 아이콘 색상
                      size: 50, // 아이콘 크기
                    ),
                  ),
                ],
              ),
            else if (bmiValue <= 22.9)
              Stack(
                children: [
                  Image.asset(
                    'images/bmi.jpg', // 이미지 경로
                    width: 300, // 이미지 가로 길이
                    height: 300, // 이미지 세로 길이
                  ),
                  Positioned(
                    top: 100, // 이미지의 중간에 위치하도록 수정
                    left: 10, // 왼쪽에 위치하도록 수정
                    child: Icon(
                      Icons.arrow_downward, // 화살표 아이콘
                      color: Colors.red, // 아이콘 색상
                      size: 50, // 아이콘 크기
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  void updateBMI() {
    double sum = weight / ((height / 100) * (height / 100));
    double sumRounded = double.parse(sum.toStringAsFixed(2));
    String a = '';

    if (sumRounded >= 0 && sumRounded <= 18.4) {
      a = '저체중';
    } else if (sumRounded <= 22.9) {
      a = '정상체중';
    } else if (sumRounded <= 24.9) {
      a = '과체중';
    } else if (sumRounded <= 29.9) {
      a = '비만';
    } else {
      a = '고도비만';
    }

    setState(() {
      textToShow = '귀하의 BMI지수는 ${sumRounded}이고, ${a} 입니다';
      bmiValue = sumRounded; // BMI 값을 업데이트
    });
  }
}
