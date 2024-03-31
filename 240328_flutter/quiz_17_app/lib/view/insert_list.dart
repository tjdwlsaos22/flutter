import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_17_app/model/message.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController textEditingController;
  late List _imageName;
  late int _selectedItem;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _imageName = ['cart.png', 'clock.png', 'pencil.png'];
    _selectedItem = 0;
    textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Picker View'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 150,
                height: 250,
                child: Image.asset(
                  'images/${_imageName[_selectedItem]}',
                  width: 100,
                  height: 100,
                ),
              ),
              SizedBox(
                width: 200,
                height: 200,
                child: CupertinoPicker(
                  itemExtent: 40,
                  scrollController: FixedExtentScrollController(initialItem: 0),
                  onSelectedItemChanged: (value) {
                    _selectedItem = value;
                    setState(() {});
                  },
                  children: List.generate(
                    3,
                    (index) => Center(
                      child: Image.asset(
                        'images/${_imageName[index]}',
                        width: 100,
                      ),
                    ),
                  ),
                ),
              ),
            ],
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
            padding: const EdgeInsets.all(30.0),
            child: ElevatedButton(
                onPressed: () {
                  addList();
                },
                child: const Text('OK')),
          )
        ],
      ),
    );
  }

  addList() {
    Message.imagePath = 'images/${_imageName[_selectedItem]}';
    Message.workList = textEditingController.text;
    Message.action = true;
    setState(() {});
    Navigator.pop(context);
  }
}
