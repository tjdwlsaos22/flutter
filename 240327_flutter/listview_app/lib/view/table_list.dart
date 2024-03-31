import 'package:flutter/material.dart';
import 'package:listview_app/model/TodoList.dart';
import 'package:listview_app/model/message.dart';

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
    todoList.add(TodoList(imagePath: 'images/bee.png', workList: '벌'));
    todoList.add(TodoList(imagePath: 'images/cat.png', workList: '고양이'));
    todoList.add(TodoList(imagePath: 'images/cow.png', workList: '염소'));
    todoList.add(TodoList(imagePath: 'images/dog.png', workList: '강아지'));
    todoList.add(TodoList(imagePath: 'images/fox.png', workList: '여우'));
    todoList.add(TodoList(imagePath: 'images/monkey.png', workList: '원숭이'));
    todoList.add(TodoList(imagePath: 'images/pig.png', workList: '돼지'));
    todoList.add(TodoList(imagePath: 'images/wolf.png', workList: '늑대'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Listview Test'),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
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
                          // 여기를 수정하여 AlertDialog를 표시합니다.
                          _showDetailDialog(todoList[index], index);
                        },
                        child: Card(
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

  _showDetailDialog(TodoList item, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(item.workList),
          content: Column(
            mainAxisSize: MainAxisSize.min, // Dialog size to fit content
            children: <Widget>[
              // 첫 번째 조건에 따라 다른 텍스트를 표시
              index == 0
                  ? const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [Text("이 동물은 곤충입니다.")]),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [Text("날 수 있습니다")])
                      ],
                    )
                  : const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [Text("이 동물은 포유류입니다.")]),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [Text("날 수 없습니다")])
                      ],
                    )
              // 다른 위젯들은 이곳에 추가...
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('종료'),
              onPressed: () {
                Navigator.of(context).pop(); // Closes the dialog
              },
            ),
          ],
        );
      },
    );
  }
}
