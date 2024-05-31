import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gate_of_olympus_app/gate_of_olympus_app.dart';
import 'package:gate_of_olympus_app/widgets/scores/scores_bloc/scores_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ScoresBloc>(create: (context) => ScoresBloc()),
      ],
      child: GateOfOlympusApp(),
    ),
  );
}
