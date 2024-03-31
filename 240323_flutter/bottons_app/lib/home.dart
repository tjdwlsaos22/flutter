import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Buttons'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onLongPress: () => print('text button'),
                onPressed: () {
                  int intNum1 = 10;
                  int intNum2 = 20;
                  print('$intNum1+$intNum2= ${intNum1 + intNum2}');
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.red,
                ),
                child: const Text('Text Button',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                    )),
              ),
              ElevatedButton(
                  onPressed: () => print('Elevated Button'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  child: const Text('Elevated Button')),
              OutlinedButton(
                  onPressed: () => print('outlined Button'),
                  style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.green,
                      side: const BorderSide(
                        color: Colors.black,
                        width: 2.0,
                      )),
                  child: const Text('outlined Button')),
              TextButton.icon(
                onPressed: () => print('Text Button Icon'),
                icon: const Icon(Icons.home, size: 30, color: Colors.red),
                label: const Text('Go to Home'),
                style: TextButton.styleFrom(foregroundColor: Colors.black),
              ),
              ElevatedButton.icon(
                onPressed: () => print('Elevate Button Icon'),
                icon: const Icon(Icons.home),
                label: const Text('home'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(150, 40)),
              ),
              ElevatedButton.icon(
                onPressed: () => print('Elevate Button Icon'),
                icon: const Icon(Icons.home),
                label: const Text('home'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    minimumSize: const Size(150, 40)),
              ),
              const SizedBox(
                  height:
                      20), // Add some spacing between the existing buttons and the new rows
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => print('TextButton'),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    child: const Text('TextButton'),
                  ),
                  const SizedBox(
                      width: 20), // Add some spacing between the buttons
                  ElevatedButton(
                    onPressed: () => print('ElevatedButton'),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    child: const Text('ElevatedButton'),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
