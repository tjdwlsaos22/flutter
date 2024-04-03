import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as http;
import 'package:json_movie_github_slider_app/edit.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List data;

  @override
  void initState() {
    super.initState();
    data = [];
    getJsonData();
  }

  getJsonData() async {
    var url = Uri.parse('https://zeushahn.github.io/Test/movies.json');
    var response = await http.get(url);
    var dataConvertedJson = json.decode(utf8.decode(response.bodyBytes));
    List result = dataConvertedJson['results'];
    data.addAll(result);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Json & Slider Test'),
      ),
      body: Center(
          child: data.isEmpty
              ? const CircularProgressIndicator()
              : ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Slidable(
                      startActionPane:
                          ActionPane(motion: const DrawerMotion(), children: [
                        SlidableAction(
                          backgroundColor: Colors.green,
                          icon: Icons.edit,
                          label: '수정',
                          onPressed: (context) {
                            Get.to(const EditPage(), arguments: [
                              data[index]['image'],
                              data[index]['title'],
                            ])!
                                .then((value) => value != null
                                    ? rebuildData(index, value)
                                    : data[index]['title']);
                          },
                        ),
                      ]),
                      endActionPane:
                          ActionPane(motion: const DrawerMotion(), children: [
                        SlidableAction(
                          backgroundColor: Colors.red,
                          icon: Icons.delete,
                          label: '삭제',
                          onPressed: (context) => selectDelete(index),
                        ),
                      ]),
                      child: Card(
                        color: index % 2 == 0
                            ? Theme.of(context).colorScheme.secondaryContainer
                            : Theme.of(context).colorScheme.tertiaryContainer,
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              ),
                              child: Image.network(
                                data[index]['image'],
                                width: 120,
                              ),
                            ),
                            Text(
                              '    ${data[index]['title']}',
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondaryContainer,
                                  fontSize: 20),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                )),
    );
  }

  selectDelete(index) {
    showCupertinoModalPopup(
      context: context,
      barrierDismissible: false,
      builder: (context) => CupertinoActionSheet(
        title: const Text('경고'),
        message: Text('${data[index]['title']}을 삭제 하시겠습니까?'),
        // message: const Text('선택한 항목을 삭제 하시겠습니까?'),
        actions: [
          CupertinoActionSheetAction(
              onPressed: () {
                data.removeAt(index);
                setState(() {});
                Get.back();
              },
              child: const Text('삭제'))
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => Get.back(),
          child: const Text('Cancel'),
        ),
      ),
    );
  }

  rebuildData(index, String str) {
    if (str.isNotEmpty) {
      data[index]['title'] = str;
      setState(() {});
    }
  }
}
