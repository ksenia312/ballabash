import 'package:ballabash/features/game/presentation/components/game_app_bar.dart';
import 'package:ballabash/features/game/presentation/view/game_view.dart';
import 'package:ballabash/features/game/router/game_route_arguments.dart';
import 'package:ballabash/features/not_found/components/error_widget.dart';
import 'package:flutter/material.dart';

import 'wrapper/game_screen_wrapper.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key, required this.args});

  final GameRouteArguments args;

  @override
  Widget build(BuildContext context) {
    return GameScreenWrapper(
      args: args,
      builder: (context, service, levelVM) {
        return Scaffold(
          appBar: GameAppBar(
            level: args.number,
            state: service.state,
            counter: levelVM.counter,
          ),
          body: service.state.buildWhen(
            inProgress: (_) => const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
            onData: (data) => GameView(vm: levelVM, config: data),
            onError: (_, error) {
              return Center(
                child: AppErrorWidget(
                  error: error is String ? error : 'Something went wrong',
                ),
              );
            },
          ),
        );
      },
    );
  }
}
