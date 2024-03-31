import 'package:flutter/material.dart';

class secondpage extends StatelessWidget {
  const secondpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Screen 2nd'),
          centerTitle: true,
          foregroundColor: Colors.black,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('screen 2nd', style: TextStyle(fontSize: 20)),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/4th'),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Second Image Page')),
            ],
          ),
        ));
  }
}
