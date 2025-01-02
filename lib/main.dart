import 'package:flutter/material.dart';
import 'package:kita/styles.dart';
import 'package:provider/provider.dart';
import 'package:kita/pages/addrecord.dart';
import 'package:kita/screens/onboarding/splash.dart';
import 'package:kita/screens/record.dart';
import 'package:kita/widgets/navbar.dart';

import 'screens/accounts.dart';
import 'screens/calendar.dart';
import 'screens/summary.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'Kita',
          theme: ThemeData(
            fontFamily: themeProvider.font,
            colorScheme: ColorScheme.fromSeed(seedColor: themeProvider.colorAccent),
            useMaterial3: true,
            scaffoldBackgroundColor: themeProvider.colorBackdrop,
          ),
          home: const Splash(),
        );
      },
    );
  }
}

class RouteScreen extends StatefulWidget {
  const RouteScreen({super.key});

  @override
  State<RouteScreen> createState() => _RouteScreenState();
}

class _RouteScreenState extends State<RouteScreen> {
  List<Widget> routes = [Record(), Calendar(), Summary(), Accounts()];

  int route = 0;
  bool _buttonPressed = false;

  void changeRoute(int route) {
    setState(() {
      this.route = route;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          routes[route],

          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: NavBar(changeRoute: changeRoute),
            ),
          ),

          Positioned.fill(
            bottom: 30,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: actionButton(),
            ),
          ),
        ],
      ),
    );
  }

  Widget actionButton() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AddRecord()),
        );
      },
      onTapDown: (_) {
        setState(() {
          _buttonPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _buttonPressed = false;
        });
      },
      onTapCancel: () {
        setState(() {
          _buttonPressed = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 25),
        width: _buttonPressed ? 71 : 70,
        height: _buttonPressed ? 71 : 70,
        decoration: BoxDecoration(
          color: context.watch<ThemeProvider>().colorAccent, // Use the provider's color
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [context.watch<ThemeProvider>().boxShadow], // Use the provider's boxShadow
        ),
        child: Icon(
          Icons.add_rounded,
          size: 40,
          color: context.watch<ThemeProvider>().colorMainBody, // Use the provider's color
        ),
      ),
    );
  }
}
