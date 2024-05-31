// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CutsceneRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CutsceneScreen(),
      );
    },
    GameRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const GameScreen(),
      );
    },
    GuideRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const GuideScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    LoadingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoadingScreen(),
      );
    },
    LoseRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoseScreen(),
      );
    },
    MagicWheelRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MagicWheelScreen(),
      );
    },
    WinRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const WinScreen(),
      );
    },
  };
}

/// generated route for
/// [CutsceneScreen]
class CutsceneRoute extends PageRouteInfo<void> {
  const CutsceneRoute({List<PageRouteInfo>? children})
      : super(
          CutsceneRoute.name,
          initialChildren: children,
        );

  static const String name = 'CutsceneRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [GameScreen]
class GameRoute extends PageRouteInfo<void> {
  const GameRoute({List<PageRouteInfo>? children})
      : super(
          GameRoute.name,
          initialChildren: children,
        );

  static const String name = 'GameRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [GuideScreen]
class GuideRoute extends PageRouteInfo<void> {
  const GuideRoute({List<PageRouteInfo>? children})
      : super(
          GuideRoute.name,
          initialChildren: children,
        );

  static const String name = 'GuideRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoadingScreen]
class LoadingRoute extends PageRouteInfo<void> {
  const LoadingRoute({List<PageRouteInfo>? children})
      : super(
          LoadingRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoadingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoseScreen]
class LoseRoute extends PageRouteInfo<void> {
  const LoseRoute({List<PageRouteInfo>? children})
      : super(
          LoseRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoseRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MagicWheelScreen]
class MagicWheelRoute extends PageRouteInfo<void> {
  const MagicWheelRoute({List<PageRouteInfo>? children})
      : super(
          MagicWheelRoute.name,
          initialChildren: children,
        );

  static const String name = 'MagicWheelRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [WinScreen]
class WinRoute extends PageRouteInfo<void> {
  const WinRoute({List<PageRouteInfo>? children})
      : super(
          WinRoute.name,
          initialChildren: children,
        );

  static const String name = 'WinRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
