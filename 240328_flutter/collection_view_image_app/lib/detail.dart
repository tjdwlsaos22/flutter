import 'package:collection_view_image_app/model/message.dart';
import 'package:flutter/material.dart';

class DetailList extends StatefulWidget {
  const DetailList({Key? key}) : super(key: key);

  @override
  State<DetailList> createState() => _DetailListState();
}

class _DetailListState extends State<DetailList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flower'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Adding some space between image and text
            Image.asset(
              'images/${Message.imagePath}',
              width: 500,
              height: 500,
            ),
          ],
        ),
      ),
    );
  }
}
