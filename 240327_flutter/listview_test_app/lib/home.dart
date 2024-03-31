import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //property
  late List<int> todoList;
  late List<String> todoList2;

  @override
  void initState() {
    // TODO: implement initState
    todoList = [];
    todoList2 = [];
    addData();
  }

  addData() {
    for (int i = 1; i <= 1000; i++) {
      todoList.add(i);
    }
    todoList2.add('James');
    todoList2.add('Cathy');
    todoList2.add('kenny');
    todoList2.add('유비');
    todoList2.add('관우');
    todoList2.add('장비');
    todoList2.add('여포');
    todoList2.add('조운');
    todoList2.add('James');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main View'),
      ),
      body: Center(
          child: ListView.builder(
              itemCount: todoList2.length, //todoList.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 100,
                  child: Card(
                    color: Colors.grey,
                    child: Center(
                      child: Text(
                        todoList2[index].toString(), //todoList[index].toString()
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                );
              })),
    );
  }
}
