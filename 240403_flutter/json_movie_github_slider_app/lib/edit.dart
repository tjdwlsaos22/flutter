import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  var value = Get.arguments ?? "데이터가 없습니다.";
  late TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    textEditingController.text = value[1];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${value[1]} 수정'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(value[0]),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: 300,
                child: TextField(
                  controller: textEditingController,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                        onPressed: () {
                          Get.back(result: textEditingController.text);
                        },
                        child: const Text('수정')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                        onPressed: () => Get.back(), child: const Text('취소')),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
