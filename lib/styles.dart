import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDark = false;

  bool get isDark => _isDark;

  set isDark(bool value) {
    _isDark = value;
    notifyListeners(); // Notify listeners when the theme changes
  }

  List<Color> get colorScheme => _isDark ? darkMode : lightMode;

  List<Color> lightMode = [
    const Color(0xFFF5F5F5),
    const Color(0xFFFFFFFF),
    const Color(0xFF333333),
  ];

  List<Color> darkMode = [
    const Color(0xFF121212),
    const Color(0xFF141414),
    const Color(0xFFFFFFFF),
  ];

  Color get colorBackdrop => colorScheme[0];
  Color get colorMainBody => colorScheme[1];
  Color get colorText => colorScheme[2];
  Color get colorAccent => const Color(0xFF39B54C);

  String get font => 'AlbertSans';

  BorderRadius get rounded => BorderRadius.circular(20);

  BoxShadow get boxShadow => BoxShadow(
        color: colorText.withOpacity(0.1),
        blurRadius: 5,
        offset: const Offset(0, 0),
      );
}
