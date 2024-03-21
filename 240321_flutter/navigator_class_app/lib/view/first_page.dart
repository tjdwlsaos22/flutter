import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class firstpage extends StatelessWidget {
  const firstpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Screen 1st'),
          centerTitle: true,
          foregroundColor: Colors.black,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('screen 1st', style: TextStyle(fontSize: 20)),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/3rd'),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('First Image Page')),
            ],
          ),
        ));
  }
}
