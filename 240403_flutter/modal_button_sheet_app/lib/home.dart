import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modal Bottom Sheet'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () => showType1Button(),
                child: const Text('Rectangle')),
            ElevatedButton(
                onPressed: () => showType2Button(),
                child: const Text('Rounded')),
            ElevatedButton(
                onPressed: () => showGet1Buttonsheet(),
                child: const Text('Rounded'))
          ],
        ),
      ),
    );
  }

  showType1Button() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 200,
          color: Theme.of(context).colorScheme.primaryContainer,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Type #1 Bottom Sheet'),
                ElevatedButton(
                    onPressed: () => Get.back(), child: const Text('Close'))
              ],
            ),
          ),
        );
      },
    );
  }

  showType2Button() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 200,
          //color: Theme.of(context).colorScheme.secondaryContainer,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.tertiaryContainer,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Type #1 Bottom Sheet'),
                ElevatedButton(
                    onPressed: () => Get.back(), child: const Text('Close'))
              ],
            ),
          ),
        );
      },
    );
  }

  showGet1Buttonsheet() {
    Get.bottomSheet(Container(
      height: 200,
      color: Theme.of(context).colorScheme.secondaryContainer,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Type #1 Bottom Sheet'),
            ElevatedButton(
                onPressed: () => Get.back(), child: const Text('Close'))
          ],
        ),
      ),
    ));
  }
}
