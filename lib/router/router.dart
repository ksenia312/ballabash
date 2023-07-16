import 'dart:async';

import 'package:ballabash/features/completed/presentation/completed_screen.dart';
import 'package:ballabash/features/game/presentation/game_screen.dart';
import 'package:ballabash/features/game/router/game_route_arguments.dart';
import 'package:ballabash/features/home/presentation/home_screen.dart';
import 'package:ballabash/features/not_found/not_found.dart';
import 'package:ballabash/router/router_utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: AppRoutes.home,
      builder: (_, __) => const HomeScreen(),
    ),
    GoRoute(
      path: AppRoutes.notFound,
      builder: (_, __) => const NotFoundScreen(),
    ),
    GoRoute(
      path: AppRoutes.game,
      redirect: gameRedirect,
      builder: (_, state) => GameScreen(
        args: (state.extra as GameRouteArguments?) ??
            GameRouteArguments(number: -1),
      ),
    ),
    GoRoute(
      path: AppRoutes.completed,
      redirect: gameRedirect,
      builder: (_, state) => CompletedScreen(
        args: (state.extra as GameRouteArguments?) ??
            GameRouteArguments(number: -1),
      ),
    )
  ],
);

FutureOr<String?> gameRedirect(BuildContext context, GoRouterState state) {
  if (state.extra is! GameRouteArguments) {
    return AppRoutes.notFound;
  }
  return null;
}
