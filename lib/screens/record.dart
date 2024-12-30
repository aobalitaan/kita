import 'package:flutter/material.dart';
import '../styles.dart';

class Record extends StatefulWidget {
  const Record({super.key});

  @override
  State<Record> createState() => _RecordState();
}

class _RecordState extends State<Record> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Record'),
        backgroundColor: Styles.color_accent, // Customize your app bar color if needed
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 150,
              color: Styles.color_accent, // You can customize the container
            ),
            // Add more widgets as needed here
          ],
        ),
      ),
    );
  }
}
