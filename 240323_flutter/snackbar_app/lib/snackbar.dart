import 'package:flutter/material.dart';

class MySnackBar extends StatelessWidget {
  const MySnackBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () => SnackBarFuction(context),
        child: const Text('snackbar Button'),
      ),
    );
  }

  SnackBarFuction(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: const Text('Elevated Button is Clicked')));
  }
}
