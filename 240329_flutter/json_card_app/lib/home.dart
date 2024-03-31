import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List newsList;

  @override
  void initState() {
    super.initState();
    newsList = [];
    getJsonData();
  }

  getJsonData() async {
    var url = Uri.parse('https://zeushahn.github.io/Test/cards.json');
    var response = await http.readBytes(url);
    List result = json.decode(utf8.decode(response))['results'];
    newsList.addAll(result);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown,
        appBar: AppBar(
          title: const Text('News'),
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
        body: newsList.isEmpty
            ? const CircularProgressIndicator()
            : ListView.builder(
                itemCount: newsList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: const Color.fromARGB(255, 61, 61, 61),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Image.network(
                              newsList[index]['image'],
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 8, 0, 12),
                              child: Row(children: [
                                Text(
                                  newsList[index]['category'],
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ]),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 360,
                                  child: Text(
                                    newsList[index]['heading'],
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                              child: Row(
                                children: [
                                  SizedBox(
                                    child: Text(
                                      newsList[index]['author'],
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ));
  }
}
