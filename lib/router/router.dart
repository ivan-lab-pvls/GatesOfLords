import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:gate_of_olympus_app/screens/game/cutscene/cutscene_screen.dart';
import 'package:gate_of_olympus_app/screens/game/game/game_screen.dart';
import 'package:gate_of_olympus_app/screens/game/guide/guide_screen.dart';
import 'package:gate_of_olympus_app/screens/game/lose/lose_screen.dart';
import 'package:gate_of_olympus_app/screens/game/win/win_screen.dart';
import 'package:gate_of_olympus_app/screens/home/home_screen.dart';
import 'package:gate_of_olympus_app/screens/loading/loading_screen.dart';
import 'package:gate_of_olympus_app/screens/magic_wheel/magic_wheel_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: LoadingRoute.page, initial: true),
    AutoRoute(page: HomeRoute.page),
    AutoRoute(page: MagicWheelRoute.page),
    AutoRoute(page: CutsceneRoute.page),
    AutoRoute(page: GameRoute.page),
    AutoRoute(page: GuideRoute.page),
    AutoRoute(page: WinRoute.page),
    AutoRoute(page: LoseRoute.page),

  ];
}
