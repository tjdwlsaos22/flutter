import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property, 초기화 필요
  late TextEditingController num1Controller;
  late TextEditingController num2Controller;

  late String textToShow = '';

  @override
  void initState() {
    super.initState();
    num1Controller = TextEditingController();
    num2Controller = TextEditingController();
  }

//키보드 여는 법 command + k
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //자동으로 다른곳클릭시 버튼사라지는 기능
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('BMI 구하기'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: num1Controller,
                decoration: const InputDecoration(
                  labelText: '신장을 입력하세요(단위:cm)',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: num2Controller,
                decoration: const InputDecoration(
                  labelText: '몸무게를 입력하세요(단위:kg)',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            //------------------------ 버튼

            ElevatedButton(
              onPressed: () => inputcheck(),
              child: const Text('BMI 계산'),
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Text(textToShow,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            Stack(
              children: [
                Image.asset(
                  "images/bmi.jpg",
                  fit: BoxFit.cover,
                ),
                if (textToShow.contains('저체중'))
                  const Positioned(
                    left: 23,
                    top: 20,
                    child: Icon(
                      Icons.arrow_downward,
                      size: 50,
                      color: Colors.red,
                    ),
                  ),
                if (textToShow.contains('정상체중'))
                  const Positioned(
                    left: 96,
                    top: 20,
                    child: Icon(
                      Icons.arrow_downward,
                      size: 50,
                      color: Colors.red,
                    ),
                  ),
                if (textToShow.contains('과체중'))
                  const Positioned(
                    left: 173,
                    top: 20,
                    child: Icon(
                      Icons.arrow_downward,
                      size: 50,
                      color: Colors.red,
                    ),
                  ),
                if (textToShow.contains('비만') && !textToShow.contains('고도비만'))
                  const Positioned(
                    left: 253,
                    top: 20,
                    child: Icon(
                      Icons.arrow_downward,
                      size: 50,
                      color: Colors.red,
                    ),
                  ),
                if (textToShow.contains('고도비만'))
                  const Positioned(
                    left: 343,
                    top: 20,
                    child: Icon(
                      Icons.arrow_downward,
                      size: 50,
                      color: Colors.red,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // --functions--
  inputcheck() {
    //textfield에 data가 있을 경우와 없을 경우
    if (num1Controller.text.trim().isNotEmpty &&
        num2Controller.text.trim().isNotEmpty) {
      setState(() {
        textToShow = showText();
      });
    } else {
      errorSnackBar();
      setState(() {
        //Error
        textToShow = '';
      });
    }
  }

  errorSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('숫자를 입력하세요'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
    ));
  }

  String showText() {
    double num1 = double.parse(num1Controller.text);
    double num2 = double.parse(num2Controller.text);
    String a = ''; // 변수 a를 함수 내부에서 정의합니다.

    double sum = (num2 / ((num1 * 0.01) * (num1 * 0.01)));
    double sumRounded = double.parse(sum.toStringAsFixed(2));

    if (sumRounded >= 0 && sumRounded <= 18.4) {
      a = '저체중'; // 변수 a를 새로운 값을 할당합니다. 새로운 변수를 선언하지 않습니다.
    } else if (sumRounded <= 22.9) {
      a = '정상체중';
    } else if (sumRounded <= 24.9) {
      a = '과체중';
    } else if (sumRounded <= 29.9) {
      a = '비만';
    } else {
      a = '고도비만';
    }

    return '귀하의 BMI지수는 ${sumRounded}이고, ${a} 입니다';
  }
}
