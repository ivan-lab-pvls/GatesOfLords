import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gate_of_olympus_app/router/router.dart';
import 'package:gate_of_olympus_app/widgets/action_button_widget.dart';

@RoutePage()
class WinScreen extends StatefulWidget {
  const WinScreen({super.key});

  @override
  State<WinScreen> createState() => _WinScreenState();
}

class _WinScreenState extends State<WinScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Color(0xFF37065D),
        body: SafeArea(
          child: Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(
                    'assets/images/elements/win.svg',
                    width: 200,
                  ),
                  Text(
                    'You Win!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset('assets/images/elements/coin.png'),
                      SizedBox(width: 5),
                      Text(
                        '200',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      ActionButtonWidget(
                          text: 'Next Level', width: 250, onTap: () {
                            context.router.push(CutsceneRoute());
                      }),
                      SizedBox(height: 15),
                      ActionButtonWidget(
                          text: 'Home', width: 250, onTap: () {
                            context.router.push(HomeRoute());
                      }),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
