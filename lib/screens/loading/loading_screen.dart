import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gate_of_olympus_app/router/router.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

@RoutePage()
class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF37065D),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/images/loading/logo.png'),
              SizedBox(height: 50),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: LinearPercentIndicator(
                    animation: true,
                    animationDuration: 2000,
                    lineHeight: 6.0,
                    percent: 1.0,
                    barRadius: Radius.circular(300),
                    backgroundColor: Color(0xFF1F0235),
                    progressColor: Color(0xFFFF34D6),
                    onAnimationEnd: () {
                      context.router.push(HomeRoute());
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
