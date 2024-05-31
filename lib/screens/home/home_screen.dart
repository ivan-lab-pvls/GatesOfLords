import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gate_of_olympus_app/router/router.dart';
import 'package:gate_of_olympus_app/widgets/action_button_widget.dart';
import 'package:gate_of_olympus_app/widgets/music_button.dart';
import 'package:gate_of_olympus_app/widgets/scores/scores.dart';
import 'package:gate_of_olympus_app/widgets/sound_button.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Color(0xFF37065D),
        appBar: AppBar(
          backgroundColor: Color(0xFF56148A),
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Spacer(),
              ScoresWidget(),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Center(
            child: Column(
              children: [
                Spacer(flex: 1),
                Stack(
                  children: [
                    Image.asset('assets/images/buttons/game-button.png'),
                    Container(
                      height: 125,
                      padding: EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Gates of Lords',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),
                          ActionButtonWidget(
                              text: 'Start Play',
                              width: 120,
                              onTap: () {
                                context.router.push(CutsceneRoute());
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Stack(
                  children: [
                    Image.asset('assets/images/buttons/fortune-button.png'),
                    Container(
                      height: 125,
                      padding: EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Magic Wheel',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),
                          ActionButtonWidget(
                              text: 'Ready',
                              width: 120,
                              onTap: () {
                                context.router.push(MagicWheelRoute());
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
                Spacer(flex: 2),
                Image.asset('assets/images/elements/avatar.png')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
