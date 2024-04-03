import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //
  late TextEditingController textEditingController;
  late String inputValue;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    inputValue = "";
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(), //키보드 내리기
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Keyboard Enter'),
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: textEditingController,
                  decoration: InputDecoration(labelText: '글자를 입력 하세요'),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.go,
                  onSubmitted: (value) {
                    if (textEditingController.text.isEmpty) {
                      errorSnackBar();
                    } else {
                      inputValue = textEditingController.text;
                      showSnackBar();
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  errorSnackBar() {
    Get.snackbar('경고', '글자를 입력하세요',
        snackPosition: SnackPosition.TOP,
        duration: Duration(seconds: 2),
        colorText: Theme.of(context).colorScheme.onError,
        backgroundColor: Theme.of(context).colorScheme.error);
  }

  showSnackBar() {
    Get.snackbar('입력완료', '입력한 글자는 ${inputValue} 입니다',
        snackPosition: SnackPosition.TOP,
        duration: Duration(seconds: 2),
        colorText: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).colorScheme.onPrimary);
  }
}
