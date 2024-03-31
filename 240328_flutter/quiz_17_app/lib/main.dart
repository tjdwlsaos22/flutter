import 'package:flutter/material.dart';
import 'package:quiz_17_app/view/insert_list.dart';
import 'package:quiz_17_app/view/table_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const TableList(),
        '/insert': (context) => const Home()
      },
      initialRoute: '/',
    );
  }
}
