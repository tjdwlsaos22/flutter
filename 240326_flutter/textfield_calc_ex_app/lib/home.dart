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

  @override
  void initState() {
    super.initState();
    num1Controller = TextEditingController();
    num2Controller = TextEditingController();
    num3Controller = TextEditingController();
    num4Controller = TextEditingController();
    num5Controller = TextEditingController();
    num6Controller = TextEditingController();
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
                              // 원하는 모양의 테두리 반경 설정
                            ),
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white),
                        child: const Text('계산하기')),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        // 여기에 지우기 기능 구현
                        num1Controller.clear();
                        num2Controller.clear();
                        num3Controller.clear();
                        num4Controller.clear();
                        num5Controller.clear();
                        num6Controller.clear();
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10), // 원하는 모양의 테두리 반경 설정
                          ),
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white),
                      child: const Text('지우기'),
                    ),
                  ],
                ),
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

  inputcheck() {
    if (num1Controller.text.trim().isNotEmpty &&
        num2Controller.text.trim().isNotEmpty) {
      setState(() {
        int num1 = int.parse(num1Controller.text);
        int num2 = int.parse(num2Controller.text);
        num3Controller.text = (num1 + num2).toString();
        num4Controller.text = (num1 - num2).toString();
        num5Controller.text = (num1 * num2).toString();
        String result =
            (num2 != 0 ? (num1 / num2).toStringAsFixed(2) : '0으로 나눌 수 없습니다');
        if (result.endsWith('.00')) {
          result = result.substring(0, result.length - 3); // 소수점과 끝의 두 자리 0 제거
        } else if (result.endsWith('0')) {
          result = result.substring(0, result.length - 1); // 끝의 한 자리 0 제거
        }

        num6Controller.text = result;
      });
    } else {
      // Error
      errorSnackBar();
      num3Controller.clear();
      num4Controller.clear();
      num5Controller.clear();
      num6Controller.clear();
    }
  }

  errorSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('숫자를 입력하세요'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
    ));
  }
}
