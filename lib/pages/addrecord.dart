import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Ensure this import is added
import '../styles.dart'; // Keep this import for styles

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
        backgroundColor: context.watch<ThemeProvider>().colorAccent, // Dynamic app bar color
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 150,
              color: context.watch<ThemeProvider>().colorAccent, // Dynamic container color
            ),
            // Add more widgets as needed here
          ],
        ),
      ),
    );
  }
}
