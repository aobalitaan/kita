import 'package:flutter/material.dart';
import '../styles.dart';

class AddRecord extends StatefulWidget {
  const AddRecord({super.key});

  @override
  State<AddRecord> createState() => _AddRecordState();
}

class _AddRecordState extends State<AddRecord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Record'),
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
