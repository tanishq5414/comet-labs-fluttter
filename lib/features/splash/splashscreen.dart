import 'package:cometlabs/features/home/bottom_navigator.dart';
import 'package:cometlabs/pallete.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animationController.forward().whenComplete(() {
      setState(() {
        _isLoading = false;
      });
      Navigator.pushAndRemoveUntil(
          context, BottomNavigationBarWidget.route(), (route) => false);
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Spacer(),
            Container(
              height: size.width * 0.5,
              width: size.width * 0.5,
              child: RiveAnimation.asset(
                'assets/images/splash.riv',
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: size.width * 0.2),
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: FadeTransition(
                      opacity: Tween<double>(begin: 0.5, end: 1.0)
                          .animate(animation),
                      child: child,
                    ),
                  );
                },
                child: _isLoading &&
                        _animationController.value <
                            0.5 // Check if animation is in the first half
                    ? _buildTextWidget('Z News')
                    : _buildTextWidget('Your Daily Dose of News'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextWidget(String text) {
    return Text(
      text,
      key: ValueKey(
          text), // Key to identify the widget during the animation switch
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Pallete.whiteColor,
      ),
    );
  }
}
