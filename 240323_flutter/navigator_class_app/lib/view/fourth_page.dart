import 'package:flutter/material.dart';

class secondimage extends StatelessWidget {
  const secondimage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Second Image Page'),
          centerTitle: true,
          foregroundColor: Colors.black,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/smile.png',
                width: 150,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () =>
                      Navigator.popUntil(context, ModalRoute.withName("/")),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Go to Home',
                  )),
            ],
          ),
        ));
  }
}
