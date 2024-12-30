import 'package:flutter/material.dart';
import 'package:kita/screens/addrecord.dart';
import 'package:kita/screens/record.dart';
import 'package:kita/styles.dart';
import 'package:kita/widgets/navbar.dart';

import 'screens/accounts.dart';
import 'screens/calendar.dart';
import 'screens/summary.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kita',
      theme: ThemeData(
        fontFamily: Styles.font,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const RouteScreen(),
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
    print(this.route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          routes[route],

          Positioned.fill(child: Align(
            alignment: Alignment.bottomCenter, 
            child:  NavBar(changeRoute: changeRoute)
          )),

          Positioned.fill(bottom: 30, child: Align(
            alignment: Alignment.bottomCenter, 
            child:  actionButton()
          ))
        ],
      ),
    );
  }

  Widget actionButton(){
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AddRecord()),
        );
        print('Action button pressed');
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
        duration: const Duration(milliseconds: 15),
        width: _buttonPressed ? 72 : 70,
        height: _buttonPressed ? 72 : 70,
        decoration: BoxDecoration(
          color: Styles.color_accent,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.25), blurRadius: 8, offset: Offset(0, 4))]
        ),
        child: Icon(
          Icons.add_rounded,
          size: 40,
          color: Styles.color_mainbody,
        ),
      )
    );
  }
}
