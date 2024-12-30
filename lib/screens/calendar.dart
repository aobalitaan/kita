import 'package:flutter/material.dart';
import '../styles.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
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
