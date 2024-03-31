import 'package:connection_view_label_app/model/message.dart';
import 'package:flutter/material.dart';

class DetailList extends StatefulWidget {
  const DetailList({super.key});

  @override
  State<DetailList> createState() => _DetailListState();
}

class _DetailListState extends State<DetailList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail View'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Adding some space between image and text
            Text(
              Message.workList,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
