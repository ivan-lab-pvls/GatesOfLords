import 'package:flutter/material.dart';
import 'package:gate_of_olympus_app/router/router.dart';

class GateOfOlympusApp extends StatelessWidget {
  GateOfOlympusApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(fontFamily: 'Montserrat'),
      routerConfig: _appRouter.config(),
      debugShowCheckedModeBanner: false,
    );
  }
}
