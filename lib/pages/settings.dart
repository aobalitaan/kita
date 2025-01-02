import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Ensure this import is added
import '../styles.dart'; // Keep this import for styles

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: context.watch<ThemeProvider>().colorAccent, // Dynamic app bar color
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Add more settings options as needed
          ],
        ),
      ),
    );
  }
}
