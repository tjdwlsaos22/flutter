import 'package:flutter/material.dart';
import 'package:quiz_17_app/model/message.dart';
import 'package:quiz_17_app/model/todo_list.dart';
import 'package:quiz_17_app/view/detail_list.dart';

class TableList extends StatefulWidget {
  const TableList({super.key});

  @override
  State<TableList> createState() => _TableListState();
}

class _TableListState extends State<TableList> {
  //property
  late List<TodoList> todoList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    todoList = [];
    addData();
  }

  addData() {
    todoList.add(TodoList(imagePath: 'images/cart.png', workList: '책 구매'));
    todoList.add(TodoList(imagePath: 'images/clock.png', workList: '철수와 약속'));
    todoList
        .add(TodoList(imagePath: 'images/pencil.png', workList: '스터디 준비하기'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Main view'),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/insert')
                      .then((value) => rebuildData());
                },
                icon: const Icon(Icons.add_outlined))
          ],
        ),
        body: Center(
            child: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                child: Dismissible(
                    direction: DismissDirection.endToStart,
                    key: ValueKey(todoList[index]),
                    onDismissed: (direction) {
                      todoList.remove(todoList[index]);
                      setState(() {});
                    },
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: const Icon(
                        Icons.delete_forever,
                        size: 50,
                      ),
                    ),
                    child: GestureDetector(
                        onTap: () {
                          Message.workList = todoList[index].workList;
                          Message.imagePath = todoList[index].imagePath;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const DetailList(),
                              ));
                        },
                        child: Card(
                            color: index % 2 == 0 ? Colors.amber : Colors.blue,
                            child: Row(
                              children: [
                                Image.asset(
                                  todoList[index].imagePath,
                                  width: 100,
                                  height: 100,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text(todoList[index].workList),
                                ),
                              ],
                            )))));
          },
        )));
  }

  rebuildData() {
    if (Message.action) {
      todoList.add(
          TodoList(imagePath: Message.imagePath, workList: Message.workList));
      Message.action = false;
      setState(() {});
    }
  }
}
