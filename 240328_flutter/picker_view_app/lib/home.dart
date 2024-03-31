import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List _imageName;
  late int _selectedItem;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
        title: const Text('Picker View'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Picker View로 이미지 선택',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 300,
              height: 200,
              child: CupertinoPicker(
                itemExtent: 30,
                scrollController: FixedExtentScrollController(initialItem: 0),
                onSelectedItemChanged: (value) {
                  _selectedItem = value;
                  setState(() {});
                },
                children: List.generate(
                  10,
                  (index) => Center(
                    child: Image.asset(
                      'images/${_imageName[index]}',
                      width: 50,
                    ),
                  ),
                ),
                // children: [
                //   Image.asset(
                //     'images/${_imageName[0]}',
                //     width: 50,
                //   ),
                //   Image.asset(
                //     'images/${_imageName[1]}',
                //     width: 50,
                //   ),
                //   Image.asset(
                //     'images/${_imageName[2]}',
                //     width: 50,
                //   ),
                //   Image.asset(
                //     'images/${_imageName[3]}',
                //     width: 50,
                //   ),
                //   Image.asset(
                //     'images/${_imageName[4]}',
                //     width: 50,
                //   ),
                //   Image.asset(
                //     'images/${_imageName[5]}',
                //     width: 50,
                //   ),
                //   Image.asset(
                //     'images/${_imageName[6]}',
                //     width: 50,
                //   ),
                //   Image.asset(
                //     'images/${_imageName[7]}',
                //     width: 50,
                //   ),
                //   Image.asset(
                //     'images/${_imageName[8]}',
                //     width: 50,
                //   ),
                //   Image.asset(
                //     'images/${_imageName[9]}',
                //     width: 50,
                //   ),
                // ],
              ),
            ),
            Text('Selected Item : ${_imageName[_selectedItem]}'),
            SizedBox(
              width: 300,
              height: 200,
              child: Image.asset(
                'images/${_imageName[_selectedItem]}',
                width: 300,
                height: 200,
                fit: BoxFit.fill,
              ),
            )
          ],
        ),
      ),
    );
  }
}
