import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  late String userId;
  late String password;

  @override
  void initState() {
    super.initState();
    userId = "";
    password = "";
    initSharedPreferences();
  }

  initSharedPreferences() async {
    final pref = await SharedPreferences.getInstance();
    userId = pref.getString('p_userid')!;
    password = pref.getString('p_userpw')!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shared Preferences Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(userId), Text(password)],
        ),
      ),
    );
  }
}
