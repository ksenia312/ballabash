import 'package:ballabash/app/domain/app_model.dart';
import 'package:ballabash/app/domain/app_service.dart';
import 'package:ballabash/features/game/domain/game_service.dart';
import 'package:ballabash/features/game/domain/level_config.dart';
import 'package:ballabash/features/game/domain/level_config_worker.dart';
import 'package:ballabash/features/game/presentation/vm/level_vm.dart';
import 'package:ballabash/features/game/presentation/components/dot.dart';
import 'package:ballabash/features/game/presentation/vm/dots_vm.dart';
import 'package:ballabash/features/game/router/game_route_arguments.dart';
import 'package:ballabash/router/router_utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class DotsView extends StatefulWidget {
  const DotsView({
    super.key,
    required this.isDragging,
    required this.biggest,
    required this.config,
  });

  final bool isDragging;
  final Size biggest;
  final LevelConfig config;

  @override
  State<DotsView> createState() => _DotsViewState();
}

class _DotsViewState extends State<DotsView> {
  @override
  void didUpdateWidget(covariant DotsView oldWidget) {
    final wasDragging = oldWidget.isDragging;
    final isDragging = widget.isDragging;
    final vm = context.read<DotsVM>();

    if (!wasDragging && isDragging) {
      vm.startTimer();
    } else if (wasDragging && !isDragging) {
      vm.close();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<DotsVM, AppService>(
      builder: (context, dotsVM, service, _) {
        return service.state.buildWhen(
          onData: (appState) => Stack(
            children: [
              ...dotsVM.dotsKeys.map(
                (e) {
                  return Dot(
                    key: e,
                    biggest: widget.biggest,
                    config: widget.config,
                    rectListener: (rect) {
                      context.read<LevelVM>().countGoals(
                        context,
                        dotRect: rect,
                        dotR: widget.config.dotSize / 2,
                        targetR: widget.config.calcTargetSize(context) / 2,
                        onDotRemove: (counter) {
                          dotsVM.dotsKeys.remove(e);
                          _checkCompleted(counter, appState);
                        },
                      );
                    },
                  );
                },
              )
            ],
          ),
        );
      },
    );
  }

  void _checkCompleted(int counter, AppModel appModel) {
    context.read<GameService>().checkCompleted(
          counter: counter,
          currentLevel: appModel.current,
          levelsCount: appModel.levelsCount,
          onCompleted: (levelsCount) {
            if (mounted) {
              context.go(
              AppRoutes.completed,
              extra: GameRouteArguments(number: widget.config.level),
            );
            }
          },
        );
  }
}
