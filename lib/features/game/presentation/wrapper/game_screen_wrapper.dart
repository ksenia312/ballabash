import 'package:ballabash/app/domain/app_service.dart';
import 'package:ballabash/di/service_locator.dart';
import 'package:ballabash/features/game/domain/game_service.dart';
import 'package:ballabash/features/game/presentation/vm/level_vm.dart';
import 'package:ballabash/features/game/router/game_route_arguments.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GameScreenWrapper extends StatelessWidget {
  const GameScreenWrapper({
    super.key,
    required this.args,
    required this.builder,
  });

  final GameRouteArguments args;
  final Widget Function(BuildContext, GameService, LevelVM) builder;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LevelVM(),
        ),
        ChangeNotifierProvider(
          create: (context) => getIt<GameService>()..init(args.number),
        ),
      ],
      child: Consumer2<LevelVM, GameService>(
        builder: (context, levelVM, service, _) {
          return builder(context, service, levelVM);
        },
      ),
    );
  }
}
