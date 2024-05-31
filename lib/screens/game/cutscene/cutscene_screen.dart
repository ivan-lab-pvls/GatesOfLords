import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gate_of_olympus_app/router/router.dart';
import 'package:gate_of_olympus_app/services/shared_preferences.dart';

@RoutePage()
class CutsceneScreen extends StatefulWidget {
  const CutsceneScreen({super.key});

  @override
  State<CutsceneScreen> createState() => _CutsceneScreenState();
}

class _CutsceneScreenState extends State<CutsceneScreen> {
  final controller = PageController();

  final List<String> texts = [
    'Set in an ancient world where gods control the elements and the destinies of mortals, Gates of Lords is an epic game where players will control the power of the most powerful Gates of Lords',
    'The player begins his adventure by receiving tasks from the god himself to prove his durability and strength in solving various puzzles by matching rows of three or more elements representing celestial phenomena and artifacts of divine power.',
    'With each successful combination of elements, the player earns points and coins, allowing him to unlock new levels and challenges, each of which requires more ingenuity and strategy.',
    'A limited number of moves and time add tension and importance to each action, while bonuses and special powerful combinations help you overcome the most difficult stages.',
    'In addition, the player can participate in additional challenges that provide unique rewards and rare artifacts that enhance his abilities.',
    'These artifacts, found throughout the game, can be used to summon special magical effects or enhance moves, making each game unique.',
    'Thus, the game "Gates of Lords" turns into an exciting adventure, where every step brings the player closer to the status of a legendary hero, capable of controlling the elements along with the gods.',
  ];

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: PageView.builder(
          controller: controller,
          physics: NeverScrollableScrollPhysics(),
          itemCount: texts.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:
                      AssetImage("assets/images/cutscene/bg-${index + 1}.png"),
                  fit: BoxFit.cover,
                ),
              ),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SafeArea(
                child: GestureDetector(
                  onTap: () {
                    if (index != 6) {
                      controller.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease);
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () async {
                              SharedPreferencesService storage =
                                  await SharedPreferencesService.getInstance();
                              storage.hearts -= 1;
                              context.router.push(GameRoute());
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 14),
                              decoration: BoxDecoration(
                                  color: Color(0x59000000),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100.0))),
                              child: Text(
                                'Skip',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Spacer(flex: 1),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/cutscene/god.png'),
                            Container(
                              padding: EdgeInsets.all(18),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(24.0))),
                              child: Text(
                                texts[index],
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                        Spacer(flex: 2),
                        Text(
                          'Tap anywhere to continue',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
