import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AppRoutes {
  static const home = '/';
  static const game = '/game';
  static const completed = '/completed';
  static const notFound = '/not-found';
}

extension PopExtension on BuildContext {
  void backHome() {
    go(AppRoutes.home);
  }

  void forcePop() {
    if (canPop()) {
      pop();
    } else {
      go(AppRoutes.home);
    }
  }
}
