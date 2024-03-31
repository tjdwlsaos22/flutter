import 'package:flutter/material.dart';
import 'package:listview_insert_app/model/animal_list.dart';
import 'package:listview_insert_app/view/first_page.dart';
import 'package:listview_insert_app/view/second_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  //property
  late TabController controller;
  late List<Animal> animalList;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
    animalList = [];
    addList();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  addList() {
    animalList.add(Animal(
        imagePath: 'images/bee.png',
        animalName: '벌',
        flyExist: true,
        kind: '곤충'));
    animalList.add(Animal(
        imagePath: 'images/cat.png',
        animalName: '고양이',
        flyExist: false,
        kind: '포유류'));
    animalList.add(Animal(
        imagePath: 'images/cow.png',
        animalName: '젖소',
        flyExist: false,
        kind: '포유류'));
    animalList.add(Animal(
        imagePath: 'images/dog.png',
        animalName: '강아지',
        flyExist: false,
        kind: '포유류'));
    animalList.add(Animal(
        imagePath: 'images/fox.png',
        animalName: '여우',
        flyExist: false,
        kind: '포유류'));
    animalList.add(Animal(
        imagePath: 'images/monkey.png',
        animalName: '원숭이',
        flyExist: false,
        kind: '영장류'));
    animalList.add(Animal(
        imagePath: 'images/pig.png',
        animalName: '돼지',
        flyExist: false,
        kind: '포유류'));
    animalList.add(Animal(
        imagePath: 'images/wolf.png',
        animalName: '늑대',
        flyExist: false,
        kind: '포유류'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ListView Test'),
        ),
        body: TabBarView(
          controller: controller,
          children: [FirstPage(list: animalList), SecondPage(list: animalList)],
        ),
        bottomNavigationBar: TabBar(
          controller: controller,
          tabs: const [
            Tab(
              icon: Icon(
                Icons.looks_one,
                color: Colors.blue,
              ),
            ),
            Tab(
                icon: Icon(
              Icons.looks_two,
              color: Colors.red,
            ))
          ],
        ));
  }
}
