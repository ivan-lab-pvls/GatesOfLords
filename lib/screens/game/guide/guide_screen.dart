import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gate_of_olympus_app/router/router.dart';
import 'package:gate_of_olympus_app/widgets/scores/scores.dart';

@RoutePage()
class GuideScreen extends StatefulWidget {
  const GuideScreen({super.key});

  @override
  State<GuideScreen> createState() => _GuideScreenState();
}

class _GuideScreenState extends State<GuideScreen> {
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
                  context.router.push(GameRoute());
                },
                child: SvgPicture.asset('assets/images/buttons/back.svg'),
              ),
              Text(
                'Guide',
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 25),
                  Text(
                    'Collect combinations of 3 or more elements in a row and get extra points. ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  SizedBox(height: 15),
                  Image.asset('assets/images/guide/1.png'),
                  SizedBox(height: 15),
                  Text(
                    'You have a limited number of moves and time. If there are several combinations, then the number of points is multiplied and you will quickly gain the number of points needed for your victory. ',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  SizedBox(height: 15),
                  Image.asset('assets/images/guide/2.png'),
                  SizedBox(height: 15),
                  Text(
                    'Use your dexterity and attention skills to quickly complete levels and receive additional rewards.',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  SizedBox(height: 15),
                  Image.asset('assets/images/guide/3.png'),
                  SizedBox(height: 15),
                  Text(
                    'The game has a daily quiz where you can try your luck and win additional bonuses that will help you. The quiz is held only once a day',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
