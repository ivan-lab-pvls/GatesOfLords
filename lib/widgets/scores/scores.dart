import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gate_of_olympus_app/widgets/scores/scores_bloc/scores_bloc.dart';

class ScoresWidget extends StatefulWidget {
  const ScoresWidget({super.key});

  @override
  State<ScoresWidget> createState() => _ScoresWidgetState();
}

class _ScoresWidgetState extends State<ScoresWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ScoresBloc()..add(GetScoresEvent()),
      child: BlocBuilder<ScoresBloc, ScoresState>(
        builder: (context, state) {
          if (state is UpdateScoresState) {
            return Row(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(5, 5, 10, 5),
                  decoration: BoxDecoration(
                      color: Color(0x90000000),
                      borderRadius: BorderRadius.all(Radius.circular(100.0))),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset('assets/images/elements/coin.png'),
                      SizedBox(width: 10),
                      Text(
                        '${state.coins}',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  padding: EdgeInsets.fromLTRB(7, 5, 10, 5),
                  decoration: BoxDecoration(
                      color: Color(0x90000000),
                      borderRadius: BorderRadius.all(Radius.circular(100.0))),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset('assets/images/elements/heart.png'),
                      SizedBox(width: 10),
                      Text(
                        '${state.hearts}',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            );

          }
          return Container();
        },
      ),
    );
  }
}
