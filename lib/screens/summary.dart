import 'package:flutter/material.dart';
import '../styles.dart';

class Summary extends StatefulWidget {
  const Summary({super.key});

  @override
  State<Summary> createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Summary'),
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
