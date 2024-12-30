import 'package:flutter/material.dart';
import '../styles.dart';

class Accounts extends StatefulWidget {
  const Accounts({super.key});

  @override
  State<Accounts> createState() => _AccountsState();
}

class _AccountsState extends State<Accounts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accounts'),
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
