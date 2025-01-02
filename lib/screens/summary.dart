import 'package:flutter/material.dart';
import 'package:kita/pages/settings.dart';
import 'package:provider/provider.dart';
import '../styles.dart'; // Ensure your theme provider and styles are correctly imported

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
        title: Text(
          'Summary',
          style: TextStyle(
            color: context.watch<ThemeProvider>().colorMainBody, // Use dynamic color
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: context.watch<ThemeProvider>().colorAccent, // Use dynamic color
        actions: [
          IconButton(
            icon: const Icon(Icons.settings), // Settings icon
            color: context.watch<ThemeProvider>().colorMainBody, // Icon color
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Settings()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100,
              color: context.watch<ThemeProvider>().colorAccent, // Use dynamic color
            ),
            // Add more widgets as needed here
          ],
        ),
      ),
    );
  }
}
