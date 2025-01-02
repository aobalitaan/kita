import 'package:flutter/material.dart';
import 'package:kita/pages/settings.dart';
import 'package:kita/styles.dart';
import 'package:provider/provider.dart'; // Ensure this import is added

class OnboardForm extends StatefulWidget {
  const OnboardForm({super.key});

  @override
  State<OnboardForm> createState() => _OnboardFormState();
}

class _OnboardFormState extends State<OnboardForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Onboarding',
          style: TextStyle(
            color: context.watch<ThemeProvider>().colorMainBody, // Dynamic text color
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: context.watch<ThemeProvider>().colorAccent, // Dynamic app bar color
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100,
              color: context.watch<ThemeProvider>().colorAccent, // Dynamic container color
            ),
            // Add more widgets as needed here
          ],
        ),
      ),
    );
  }
}
