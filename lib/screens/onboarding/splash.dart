import 'package:flutter/material.dart';
import 'package:kita/screens/onboarding/form.dart';
import 'package:kita/screens/onboarding/info.dart';
import 'package:kita/styles.dart';
import 'package:provider/provider.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}
class _SplashState extends State<Splash> {
  int currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  void _navigateToNextPage() {
    if (currentIndex < SplashInfo.info.length) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _navigateToOnboardForm();
    }
  }

  void _navigateToOnboardForm() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const OnboardForm()),
    );
  }

  @override
  Widget build(BuildContext context) {
    // AnimatedContainer to smoothly animate background color change
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              color: context.watch<ThemeProvider>().colorBackdrop,
              child: _buildPageView(),
            ),
            _buildSkipButton(),
            _buildBottomControls(),
          ],
        ),
      ),
    );
  }

  Widget _buildPageView() {
    return PageView.builder(
      controller: _pageController,
      onPageChanged: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      itemCount: SplashInfo.info.length + 1, // One additional page for theme selection
      itemBuilder: (context, index) {
        if (index == 0) {
          return _buildThemeSelectionPage(); // The first page for theme selection
        } else {
          final currentInfo = SplashInfo.info[index - 1];
          return _buildSplashContent(
            image: currentInfo["Image"],
            title: currentInfo["Title"],
            description: currentInfo["Description"],
          );
        }
      },
    );
  }

  Widget _buildSkipButton() {
    return Positioned(
      top: 20,
      right: 20,
      child: TextButton(
        onPressed: _navigateToOnboardForm,
        child: Text(
          'Skip',
          style: TextStyle(
            fontSize: 16,
            color: context.watch<ThemeProvider>().colorText,
          ),
        ),
      ),
    );
  }

  Widget _buildSplashContent({String? image, String? title, String? description}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 3,
          child: image != null && image.isNotEmpty
              ? Image.asset(
                  image,
                  fit: BoxFit.cover,  // This fills the width while preserving aspect ratio
                  width: double.infinity,  // Ensures it takes up the full width
                )
              : const Placeholder(),
        ),

        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title ?? '',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: context.watch<ThemeProvider>().colorText,
                  ),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 5),
                Text(
                  description ?? '',
                  style: TextStyle(
                    fontSize: 16,
                    color: context.watch<ThemeProvider>().colorText,
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomControls() {
    return Positioned(
      bottom: 40,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDotsIndicator(),
            const SizedBox(height: 20),
            _buildNextButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildDotsIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        SplashInfo.info.length + 1, // One more dot for the theme selection page
        (index) {
          double widthFactor = currentIndex == index ? 2 : 1;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: widthFactor * 16.0,
            height: 8,
            decoration: BoxDecoration(
              color: currentIndex == index
                  ? context.watch<ThemeProvider>().colorAccent
                  : Colors.grey.shade400,
              borderRadius: context.watch<ThemeProvider>().rounded,
            ),
          );
        },
      ),
    );
  }

  Widget _buildNextButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _navigateToNextPage,
        style: ElevatedButton.styleFrom(
          backgroundColor: context.watch<ThemeProvider>().colorAccent,
          shape: RoundedRectangleBorder(
            borderRadius: context.watch<ThemeProvider>().rounded,
          ),
          padding: const EdgeInsets.symmetric(vertical: 15),
        ),
        child: Text(
          currentIndex == SplashInfo.info.length
              ? 'Get Started'
              : 'Next',
          style: TextStyle(color: context.watch<ThemeProvider>().colorBackdrop, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

 Widget _buildThemeSelectionPage() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        'Select Your Theme',
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: context.watch<ThemeProvider>().colorText,
        ),
      ),
      const SizedBox(height: 30),
      _buildThemeOption(
        icon: Icons.wb_sunny,
        text: 'Light Mode',
        isDarkMode: false,
        iconColor: Colors.orange,
        textColor: Colors.black,
        borderColor: Colors.grey.shade400,
        activeIconColor: Colors.grey.shade400,
        activeTextColor: Colors.grey.shade400,
      ),
      const SizedBox(height: 20),
      _buildThemeOption(
        icon: Icons.nights_stay,
        text: 'Dark Mode',
        isDarkMode: true,
        iconColor: Colors.yellow,
        textColor: Colors.white,
        borderColor: Colors.grey.shade400,
        activeIconColor: Colors.grey.shade400,
        activeTextColor: Colors.grey.shade400,
      ),
    ],
  );
}

Widget _buildThemeOption({
  required IconData icon,
  required String text,
  required bool isDarkMode,
  required Color iconColor,
  required Color textColor,
  required Color borderColor,
  required Color activeIconColor,
  required Color activeTextColor,
}) {
  return GestureDetector(
    onTap: () {
      setState(() {
        context.read<ThemeProvider>().isDark = isDarkMode; // Toggle mode
      });
    },
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: context.watch<ThemeProvider>().isDark
            ? context.watch<ThemeProvider>().colorBackdrop
            : context.watch<ThemeProvider>().colorMainBody,
        borderRadius: context.watch<ThemeProvider>().rounded,
        border: Border.all(
          color: context.watch<ThemeProvider>().isDark == isDarkMode
              ? context.watch<ThemeProvider>().colorAccent
              : borderColor,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: context.watch<ThemeProvider>().isDark == isDarkMode
                ? iconColor
                : activeIconColor,
          ),
          const SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(
              color: context.watch<ThemeProvider>().isDark == isDarkMode
                  ? textColor
                  : activeTextColor,
              fontSize: 18,
            ),
          ),
        ],
      ),
    ),
  );
}

}
