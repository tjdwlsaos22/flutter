import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late bool button2Visible;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    button2Visible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hide Widget'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  button2Visible = true;
                  setState(() {});
                },
                child: const Text('1.Button')),
            Visibility(
                visible: button2Visible,
                child: TextButton(
                    onPressed: () {
                      button2Visible = false;
                    },
                    child: const Text('2.Button'))),
            TextButton(
                onPressed: () {
                  button2Visible = true;
                  setState(() {});
                },
                child: const Text('3.Button'))
          ],
        ),
      ),
    );
  }
}
