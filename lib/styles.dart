import 'package:flutter/material.dart';

class Styles {
  static Color color_backdrop = const Color(0xFFDBDADA);
  static Color color_mainbody = const Color(0xFFFFFFFF);
  static Color color_text = const Color(0xFF1E1E1E);
  // static Color color_accent = const Color(0xFF39B54C);
  static Color color_accent = const Color.fromARGB(255, 29, 175, 208);

  static String font = 'AlbertSans';

  static BorderRadius rounded = BorderRadius.circular(20);
  static BoxShadow boxShadow =  BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  blurRadius: 5,
                                  offset: Offset(0, 4),
                                );
}
