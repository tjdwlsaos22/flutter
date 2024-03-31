import 'package:flutter/material.dart';
import 'package:listview_todo_app/model/message.dart';

class InsertList extends StatefulWidget {
  const InsertList({Key? key}) : super(key: key);

  @override
  State<InsertList> createState() => _InsertListState();
}

class _InsertListState extends State<InsertList> {
  late TextEditingController textEditingController;
  late bool _switch1 = true;
  late bool _switch = false;
  late bool _switch2 = false;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    _imageName = [
      'w1.jpg',
      'w2.jpg',
      'w3.jpg',
      'w4.jpg',
      'w5.jpg',
      'w6.jpg',
      'w7.jpg',
      'w8.jpg',
      'w9.jpg',
      'w10.jpg'
    ];
    _selectedItem = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Insert'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '구매',
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Switch(
                      value: _switch1,
                      onChanged: (value) {
                        setState(() {
                          _switch1 = value;
                          if (value) {
                            _switch = false;
                            _switch2 = false;
                          }
                          if (!_switch && !_switch1 && !_switch2) {
                            setState(() {
                              _switch1 =
                                  true; // 모든 스위치가 꺼져있을 때 구매 스위치를 자동으로 켭니다.
                            });
                          }
                        });
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Image.asset(
                      'images/cart.png',
                      width: 45,
                      height: 45,
                    ),
                  ],
                ),
              ),
            ),
            // Add space between switches
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '약속',
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Switch(
                      value: _switch,
                      onChanged: (value) {
                        setState(() {
                          _switch = value;
                          if (value) {
                            _switch1 = false;
                            _switch2 = false;
                          }
                          if (!_switch && !_switch1 && !_switch2) {
                            setState(() {
                              _switch1 =
                                  true; // 모든 스위치가 꺼져있을 때 구매 스위치를 자동으로 켭니다.
                            });
                          }
                        });
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Image.asset(
                      'images/clock.png',
                      width: 45,
                      height: 45,
                    ),
                  ],
                ),
              ),
            ),
            // Add space between rows
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '스터디',
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Switch(
                      value: _switch2,
                      onChanged: (value) {
                        setState(() {
                          _switch2 = value;
                          if (value) {
                            _switch = false;
                            _switch1 = false;
                          }
                          if (!_switch && !_switch1 && !_switch2) {
                            setState(() {
                              _switch1 =
                                  true; // 모든 스위치가 꺼져있을 때 구매 스위치를 자동으로 켭니다.
                            });
                          }
                        });
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Image.asset(
                      'images/pencil.png',
                      width: 45,
                      height: 45,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20), // Add space between rows
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: textEditingController,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 5),
                  labelText: '목록을 입력하세요',
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: () {
                  if (textEditingController.text.trim().isNotEmpty) {
                    addlist();
                  }
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addlist() {
    if (_switch1) {
      Message.imagePath = 'images/cart.png';
    } else if (_switch) {
      Message.imagePath = 'images/clock.png';
    } else if (_switch2) {
      Message.imagePath = 'images/pencil.png';
    }
    Message.workList = textEditingController.text;
    Message.action = true;
  }
}
