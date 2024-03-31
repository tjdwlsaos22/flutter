import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController num1Controller;
  late TextEditingController num2Controller;
  late TextEditingController num3Controller;
  late TextEditingController num4Controller;
  late TextEditingController num5Controller;
  late TextEditingController num6Controller;
  late bool switchValue;
  late bool switchValue1;
  late bool switchValue2;
  late bool switchValue3;

  @override
  void initState() {
    super.initState();
    num1Controller = TextEditingController();
    num2Controller = TextEditingController();
    num3Controller = TextEditingController();
    num4Controller = TextEditingController();
    num5Controller = TextEditingController();
    num6Controller = TextEditingController();
    switchValue = true; // switchValue를 여기서 초기화합니다.
    switchValue1 = true;
    switchValue2 = true;
    switchValue3 = true;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('간단한 계산기'),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(width: 40),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: num1Controller,
                  decoration: const InputDecoration(
                    labelText: '첫번째 숫자를 입력하세요',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: num2Controller,
                  decoration: const InputDecoration(
                    labelText: '두번째 숫자를 입력하세요',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => inputcheck(),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('계산하기'),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        num1Controller.clear();
                        num2Controller.clear();
                        num3Controller.clear();
                        num4Controller.clear();
                        num5Controller.clear();
                        num6Controller.clear();
                        switchValue = true;
                        switchValue1 = true;
                        switchValue2 = true;
                        switchValue3 = true;
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('지우기'),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('덧셈'),
                  Switch(
                      value: switchValue,
                      onChanged: (value) {
                        switchValue = value;
                        setState(() {});
                      }),
                  Text('뺄셈'),
                  Switch(
                      value: switchValue1,
                      onChanged: (value) {
                        switchValue1 = value;
                        setState(() {});
                      }),
                  Text('곱셈'),
                  Switch(
                      value: switchValue2,
                      onChanged: (value) {
                        switchValue2 = value;
                        setState(() {});
                      }),
                  Text('나눗셈'),
                  Switch(
                      value: switchValue3,
                      onChanged: (value) {
                        switchValue3 = value;
                        setState(() {});
                      }),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: num3Controller,
                  readOnly: true,
                  decoration: const InputDecoration(
                    labelText: '덧셈 결과',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: num4Controller,
                  readOnly: true,
                  decoration: const InputDecoration(
                    labelText: '뺄셈 결과',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: num5Controller,
                  readOnly: true,
                  decoration: const InputDecoration(
                    labelText: '곱셈 결과',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: num6Controller,
                  readOnly: true,
                  decoration: const InputDecoration(
                    labelText: '나눗셈 결과',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  addition() {
    int num1 = int.parse(num1Controller.text);
    int num2 = int.parse(num2Controller.text);
    int sum = num1 + num2;
    return sum;
  }

  minus() {
    int num1 = int.parse(num1Controller.text);
    int num2 = int.parse(num2Controller.text);
    int sum = num1 - num2;
    return sum;
  }

  mul() {
    int num1 = int.parse(num1Controller.text);
    int num2 = int.parse(num2Controller.text);
    int sum = num1 * num2;
    return sum;
  }

  double div() {
    int num1 = int.parse(num1Controller.text);
    int num2 = int.parse(num2Controller.text);

    // 예외 처리: 0으로 나누는 경우
    if (num2 == 0 || num1 == 0) {
      return 0.0; // 또는 다른 값으로 처리
    }

    double result = num1 / num2;
    return double.parse(result.toStringAsFixed(2));
  }

  inputcheck() {
    if (num1Controller.text.trim().isNotEmpty &&
        num2Controller.text.trim().isNotEmpty) {
      setState(() {
        if (switchValue) {
          num3Controller.text = addition().toString();
        } else {
          num3Controller.clear();
        }

        if (switchValue1) {
          num4Controller.text = minus().toString();
        } else {
          num4Controller.clear();
        }

        if (switchValue2) {
          num5Controller.text = mul().toString();
        } else {
          num5Controller.clear();
        }

        if (switchValue3) {
          num6Controller.text = div().toString();
        } else {
          num6Controller.clear();
        }
      });
    } else {
      errorSnackBar();
      num3Controller.clear();
      num4Controller.clear();
      num5Controller.clear();
      num6Controller.clear();
    }
  }

  errorSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('숫자를 입력하세요'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }
}
