import 'package:flutter/material.dart';
import 'package:kita/styles.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key, required this.changeRoute});

  final Function(int) changeRoute;

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> with TickerProviderStateMixin {
  int _activeRoute = 0;

  final List<String> _titles = ["Record", "Calendar", "Summary", "Accounts"];
  final List<String> _icons = [
    "assets/ic_record.png",
    "assets/ic_calendar.png",
    "assets/ic_summary.png",
    "assets/ic_accounts.png"
  ];

  late List<AnimationController> _slideControllers;
  late List<Animation<Offset>> _slideAnimations;

  @override
  void initState() {
    super.initState();

    _slideControllers = List.generate(
      _titles.length,
      (index) => AnimationController(
        duration: const Duration(milliseconds: 150),
        vsync: this,
      ),
    );

    _slideAnimations = List.generate(
      _titles.length,
      (index) => Tween<Offset>(
        begin: const Offset(0, 0.1),  
        end: Offset.zero,            
      ).animate(CurvedAnimation(parent: _slideControllers[index], curve: Curves.easeOut)),
    );
  }

  @override
  void dispose() {
    // Dispose of the animation controllers when done
    for (var controller in _slideControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Styles.color_mainbody,
            borderRadius: Styles.rounded,
            boxShadow: [
              Styles.boxShadow
            ],
          ),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          margin: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: 50, width: 60, child: _buildIconWithTitle(_icons[0], 0)),
              SizedBox(height: 50, width: 60, child: _buildIconWithTitle(_icons[1], 1)),
              SizedBox(width: 75),
              SizedBox(height: 50, width: 60, child: _buildIconWithTitle(_icons[2], 2)),
              SizedBox(height: 50, width: 60, child: _buildIconWithTitle(_icons[3], 3)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildIconWithTitle(String iconPath, int routeIndex) {
    // Trigger animation only when the active route changes
    if (_activeRoute == routeIndex) {
      _slideControllers[routeIndex].forward();
    } else {
      _slideControllers[routeIndex].reverse();
    }

    return AnimatedBuilder(
      animation: _slideAnimations[routeIndex],
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _activeRoute = routeIndex;
            });
            widget.changeRoute(routeIndex);
          },
          child: SlideTransition(
            position: _slideAnimations[routeIndex],
            child: Stack(
              alignment: Alignment.center,

              children: [
                iconTile(iconPath, routeIndex),
                textTile(routeIndex)
              ],
            ),
          ),
        );
      },
    );
  }


  Widget iconTile(iconPath, routeIndex){
    return Column(
      children: [
        SizedBox(height: 8),
        Image.asset(
          iconPath,
          color: _activeRoute == routeIndex ? Styles.color_accent : Styles.color_text,
          width: 24,
          height: 24,
        ),
        SizedBox(height: 8),
      ],
    );
  }

  Widget textTile(routeIndex){
    return Column(
      children: [
        SizedBox(height: 29),
        AnimatedOpacity(
          duration: const Duration(milliseconds: 50),
          opacity: _activeRoute == routeIndex ? 1.0 : 0.0,
          child: _activeRoute == routeIndex
              ? Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(
                    _titles[routeIndex],
                    style: TextStyle(
                      color: Styles.color_accent,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : Container(),
        ),
      ],
    );
  }
}
