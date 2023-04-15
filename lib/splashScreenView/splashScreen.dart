import 'dart:async';
import 'package:movie_app/LoginView/loginPage.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:movie_app/Splash%20Services/SplashServices.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: Duration(seconds: 3), vsync: this)
        ..repeat();
  SplashServices services = SplashServices();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    services.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedBuilder(
            animation: _controller,
            child: const Center(
              child: SizedBox(
                  height: 200,
                  width: 200,
                  child:
                      Image(image: AssetImage('assets/images/moviewheel.png'))),
            ),
            builder: (context, child) {
              return Transform.rotate(
                angle: _controller.value * 1.5 * math.pi,
                child: child,
              );
            },
          ),
          const SizedBox(
            height: 10,
          ),
          const Center(
            child: SizedBox(
                height: 100,
                width: 300,
                child:
                    Image(image: AssetImage('assets/images/sloganmovie.png'))),
          )
        ],
      ),
    );
  }
}
