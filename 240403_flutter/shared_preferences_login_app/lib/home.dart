import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_login_app/second_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with WidgetsBindingObserver {
  late TextEditingController userIdController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    userIdController = TextEditingController();
    passwordController = TextEditingController();
    initSharedPreferences();
  }

  initSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    userIdController.text = prefs.getString('p_userid') ?? "";
    passwordController.text = prefs.getString('p_userpw') ?? "";

    // 앱을 종료하고 다시 실행하면 SharedPreferences에 남아있다.
    // 앱을 종료 시 정리해야 한다.
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      // 다른 앱으로 전환했을 때,
      case AppLifecycleState.detached:
        break;
      // 앱이 다시 실행되었을 때,
      case AppLifecycleState.resumed:
        break;
      // 앱이 완전히 종료되었을 때,
      case AppLifecycleState.inactive:
        disposeSharedPreferences();
        break;
      // 앱이 중지되었을 떄,
      case AppLifecycleState.paused:
        break;
      default:
        break;
    }
  }

  disposeSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log In'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('ID        '),
                  SizedBox(
                    width: 250,
                    child: TextField(
                      controller: userIdController,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('PW      '),
                  SizedBox(
                    width: 250,
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: ElevatedButton(
                  onPressed: () {
                    saveSharedPreferences();
                    Get.to(
                      const SecondPage(),
                    );
                  },
                  child: const Text('Login')),
            )
          ],
        ),
      ),
    );
  }

  saveSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('p_userid', userIdController.text);
    prefs.setString('p_userpw', passwordController.text);
  }
}
