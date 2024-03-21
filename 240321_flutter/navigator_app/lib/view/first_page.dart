import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:navigator_app/view/second_page.dart';

class firstpage extends StatelessWidget {
  const firstpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('first page')),
      body: Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const secondpage();
                }));
              },
              child: const Text('go to the second page'))),
    );
  }
}
