import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gate_of_olympus_app/router/router.dart';
import 'package:gate_of_olympus_app/services/shared_preferences.dart';
import 'package:gate_of_olympus_app/widgets/scores/scores.dart';
import 'package:gate_of_olympus_app/widgets/scores/scores_bloc/scores_bloc.dart';

enum BonusType { coins, hearts }

@RoutePage()
class MagicWheelScreen extends StatefulWidget {
  const MagicWheelScreen({super.key});

  @override
  State<MagicWheelScreen> createState() => _MagicWheelScreenState();
}

class _MagicWheelScreenState extends State<MagicWheelScreen> {
  StreamController<int> controller = StreamController<int>();

  int resultIndex = 0;

  final List<String> items = [
    '0',
    '20',
    '1',
    '30',
    '2',
    '40',
    '3',
    '50',
    '4',
    '60',
    '5',
    '70',
    '6',
    '100',
  ];

  bool isSpin = false;

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }

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
              GestureDetector(
                onTap: () {
                  context.router.push(HomeRoute());
                },
                child: SvgPicture.asset('assets/images/buttons/back.svg'),
              ),
              Text(
                'Magic Wheel',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
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
                Container(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SvgPicture.asset('assets/images/fortune/wheel-bg.svg'),
                      SizedBox(
                        width: 315,
                        height: 315,
                        child: FortuneWheel(
                          physics: NoPanPhysics(),
                          animateFirst: false,
                          selected: controller.stream,
                          items: [
                            for (var item in items)
                              FortuneItem(
                                child: int.parse(item) < 10
                                    ? Row(
                                        children: [
                                          SizedBox(width: 80),
                                          Image.asset(
                                              'assets/images/elements/heart.png'),
                                          SizedBox(width: 5),
                                          Text(
                                            item,
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white),
                                          ),
                                        ],
                                      )
                                    : Row(
                                        children: [
                                          SizedBox(width: 80),
                                          Image.asset(
                                              'assets/images/elements/coin.png'),
                                          SizedBox(width: 5),
                                          Text(
                                            item,
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                style: FortuneItemStyle(
                                  borderWidth: 0,
                                  color: int.parse(item) < 10
                                      ? Color(0xFFAA00E6)
                                      : Color(0xFF260076),
                                ),
                              ),
                          ],
                          indicators: <FortuneIndicator>[
                            FortuneIndicator(
                              alignment: Alignment.topCenter,
                              child: Image.asset(
                                  'assets/images/fortune/indicator.png'),
                            ),
                          ],
                          onAnimationStart: () {
                            Future.delayed(const Duration(seconds: 5), () {
                              setState(() {
                                isSpin = true;
                              });
                            });
                          },
                          onAnimationEnd: () {
                            Future.delayed(const Duration(seconds: 3), () {
                              setState(() {
                                isSpin = false;
                              });
                            });
                            if (int.parse(items[resultIndex]) < 10) {
                              context.read<ScoresBloc>().add(AddHeartsEvent(value: int.parse(items[resultIndex])));
                            } else {
                              context.read<ScoresBloc>().add(AddCoinsEvent(value: int.parse(items[resultIndex])));
                            }
                          },
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          SharedPreferencesService storage = await SharedPreferencesService.getInstance();
                          storage.coins -= 20;
                          resultIndex = Fortune.randomInt(0, items.length);
                          controller.add(resultIndex);
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SvgPicture.asset(
                                'assets/images/fortune/wheel-button.svg'),
                            !isSpin
                                ? Text(
                                    'Spin',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  )
                                : Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(int.parse(
                                                  items[resultIndex]) <
                                              10
                                          ? 'assets/images/elements/heart.png'
                                          : 'assets/images/elements/coin.png'),
                                      SizedBox(width: 5),
                                      Text(
                                        items[resultIndex],
                                        style: TextStyle(
                                            decoration: TextDecoration.none,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(flex: 2),
                Image.asset('assets/images/elements/avatar.png'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
