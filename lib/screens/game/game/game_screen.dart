import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gate_of_olympus_app/router/router.dart';
import 'package:gate_of_olympus_app/widgets/scores/scores.dart';
import 'package:gate_of_olympus_app/widgets/scores/scores_bloc/scores_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';

@RoutePage()
class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int startGameTime = DateTime.now().millisecondsSinceEpoch;

  int moves = 0;

  @override
  void initState() {
    super.initState();
    initializeBoard();
  }

  List<List<String>> board = List.generate(7, (i) => List.filled(5, ""));

  int selectedRow = -1;
  int selectedColumn = -1;

  List<String> elements = [
    'assets/images/game/1.png',
    'assets/images/game/2.png',
    'assets/images/game/3.png',
    'assets/images/game/4.png',
    'assets/images/game/5.png',
    'assets/images/game/6.png',
  ];

  int coins = 0;
  bool isWin = false;
  bool _isTap = false;

  void initializeBoard() {
    for (int i = 0; i < 5; i++) {
      for (int j = 0; j < 5; j++) {
        board[i][j] = elements[Random().nextInt(6)];
      }
    }
  }

  void checkForMatchesAndSwapBack() {
    bool matchesFound = false;

    _isTap = false;
    for (int i = 0; i < 6; i++) {
      for (int j = 0; j < 3; j++) {
        if (board[i][j] == board[i][j + 1] && board[i][j] == board[i][j + 2]) {
          if (moves < 10) {
            moves += 1;
          }
          board[i][j] = elements[Random().nextInt(6)];
          board[i][j + 1] = elements[Random().nextInt(6)];
          board[i][j + 2] = elements[Random().nextInt(6)];
          setState(() {});
          matchesFound = true;
          selectedRow = -1;
          selectedColumn = -1;
          checkWin();
        }
      }
    }
    for (int j = 0; j < 5; j++) {
      for (int i = 0; i < 5; i++) {
        if (board[i][j] == board[i + 1][j] && board[i][j] == board[i + 2][j]) {
          if (moves < 10) {
            moves += 1;
          }
          board[i][j] = elements[Random().nextInt(6)];
          board[i + 1][j] = elements[Random().nextInt(6)];
          board[i + 2][j] = elements[Random().nextInt(6)];
          setState(() {});
          matchesFound = true;
          selectedRow = -1;
          selectedColumn = -1;
          checkWin();
        }
      }
    }
  }

  void checkWin() {
    if (moves >= 10) {
      isWin = true;
      Future.delayed(const Duration(seconds: 1), () {
        context.read<ScoresBloc>().add(AddCoinsEvent(value: 200));
        context.router.push(WinRoute());
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/game/bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {
                            context.router.push(HomeRoute());
                          },
                          child: SvgPicture.asset(
                              'assets/images/buttons/menu.svg')),
                      Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: LinearPercentIndicator(
                                animation: true,
                                animationDuration: 2 * 60 * 1000,
                                lineHeight: 20.0,
                                percent: 1.0,
                                barRadius: Radius.circular(300),
                                backgroundColor: Color(0x90000000),
                                progressColor: Color(0xFF34CEFF),
                                onAnimationEnd: () {
                                  context.router.push(LoseRoute());
                                }),
                          ),
                          Image.asset('assets/images/game/clock.png'),
                        ],
                      ),
                      ScoresWidget(),
                    ],
                  ),
                  SizedBox(
                    width: 210,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 200,
                          child: LinearPercentIndicator(
                            animateFromLastPercent: true,
                            animation: false,
                            lineHeight: 10.0,
                            percent: moves / 10,
                            barRadius: Radius.circular(300),
                            backgroundColor: Color(0xFF220837),
                            progressColor: Color(0xFFFFC700),
                            onAnimationEnd: () {
                              context.read<ScoresBloc>().add(AddCoinsEvent(value: 200));
                              context.router.push(WinRoute());
                            },
                          ),
                        ),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: SvgPicture.asset(
                                'assets/images/game/empty-star.svg')),
                        Align(
                            alignment: Alignment.centerRight,
                            child: SvgPicture.asset(
                                'assets/images/game/star.svg')),
                      ],
                    ),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset('assets/images/game/avatar.png'),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Color(0xCC000000),
                              border: Border.all(
                                  width: 2, color: Color(0xFFFA00FF)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          child: Column(
                            children: [
                              SvgPicture.asset('assets/images/game/moves.svg'),
                              Text(
                                'Moves',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                              Text(
                                '$moves',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.router.push(GuideRoute());
                        },
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Color(0xCC000000),
                                border: Border.all(
                                    width: 2, color: Color(0xFFFA00FF)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            child: Column(
                              children: [
                                Image.asset('assets/images/game/guide.png'),
                                SizedBox(height: 3),
                                Text(
                                  'Guide',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset('assets/images/game/board.png'),
                            Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: List.generate(5, (i) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: List.generate(5, (j) {
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _isTap = true;
                                            if (selectedRow == -1 &&
                                                selectedColumn == -1) {
                                              selectedRow = i;
                                              selectedColumn = j;
                                            } else {
                                              if ((i == selectedRow &&
                                                      j ==
                                                          selectedColumn - 1) ||
                                                  (i == selectedRow &&
                                                      j ==
                                                          selectedColumn + 1) ||
                                                  (i == selectedRow - 1 &&
                                                      j == selectedColumn) ||
                                                  (i == selectedRow + 1 &&
                                                      j == selectedColumn)) {
                                                // Swap elements
                                                String temp = board[selectedRow]
                                                    [selectedColumn];
                                                board[selectedRow]
                                                        [selectedColumn] =
                                                    board[i][j];
                                                board[i][j] = temp;
                                                checkForMatchesAndSwapBack();
                                              } else {
                                                selectedRow = i;
                                                selectedColumn = j;
                                              }
                                            }
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: _isTap &&
                                                  i == selectedRow &&
                                                  j == selectedColumn
                                              ? AnimatedContainer(
                                                  duration: Duration(
                                                      milliseconds: 200),
                                                  child: Center(
                                                    child: Image.asset(
                                                      board[i][j],
                                                      width: 55,
                                                    ),
                                                  ),
                                                  width: _isTap &&
                                                          i == selectedRow &&
                                                          j == selectedColumn
                                                      ? 48
                                                      : 55,
                                                  height: _isTap &&
                                                          i == selectedRow &&
                                                          j == selectedColumn
                                                      ? 48
                                                      : 55,
                                                ).animate()
                                              : AnimatedContainer(
                                                  duration: Duration(
                                                      milliseconds: 200),
                                                  child: Center(
                                                    child: Image.asset(
                                                      board[i][j],
                                                      width: 55,
                                                    ),
                                                  ),
                                                  width: _isTap &&
                                                          i == selectedRow &&
                                                          j == selectedColumn
                                                      ? 48
                                                      : 55,
                                                  height: _isTap &&
                                                          i == selectedRow &&
                                                          j == selectedColumn
                                                      ? 48
                                                      : 55,
                                                ).animate(),
                                        )
                                            .animate()
                                            .fade(begin: 0.5)
                                            .scale(delay: 500.ms),
                                      );
                                    }),
                                  );
                                }),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
