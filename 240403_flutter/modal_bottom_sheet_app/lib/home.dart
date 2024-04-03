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
        title: const Text('Model Bottom Sheet'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () => showType1BottomSheet(),
                child: const Text('Rectangle')),
            ElevatedButton(
                onPressed: () => showType2BottomSheet(),
                child: const Text('Rounded')),
            ElevatedButton(
                onPressed: () => showGet1BottomSheet(),
                child: const Text('GetX : Rectangle')),
            ElevatedButton(
                onPressed: () => showGet2BottomSheet(),
                child: const Text('GetX : Rounded')),
          ],
        ),
      ),
    );
  }

  showType1BottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext buildContext) {
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

  showType2BottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext buildContext) {
        return Container(
          height: 200,
          // color: Theme.of(context).colorScheme.tertiaryContainer,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onSecondary,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Type #2 Bottom Sheet'),
                ElevatedButton(
                    onPressed: () => Get.back(), child: const Text('Close'))
              ],
            ),
          ),
        );
      },
    );
  }

  showGet1BottomSheet() {
    Get.bottomSheet(Container(
      height: 200,
      // color: Theme.of(context).colorScheme.tertiaryContainer,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSecondary,
      ),
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

  showGet2BottomSheet() {
    Get.bottomSheet(Container(
      height: 200,
      // color: Theme.of(context).colorScheme.tertiaryContainer,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSecondary,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Type #2 Bottom Sheet'),
            ElevatedButton(
                onPressed: () => Get.back(), child: const Text('Close'))
          ],
        ),
      ),
    ));
  }
}
