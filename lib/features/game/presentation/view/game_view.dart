import 'package:ballabash/features/game/domain/level_config.dart';
import 'package:ballabash/features/game/domain/level_config_worker.dart';
import 'package:ballabash/features/game/presentation/vm/level_vm.dart';
import 'package:ballabash/features/game/presentation/components/draggable_target.dart';
import 'package:ballabash/features/game/presentation/vm/dots_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dots_view.dart';

class GameView extends StatelessWidget {
  const GameView({
    super.key,
    required this.vm,
    required this.config,
  });

  final LevelVM vm;
  final LevelConfig config;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.black,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              ChangeNotifierProvider(
                create: (_) => DotsVM(config.dotsFrequentInMilliseconds),
                child: DotsView(
                  config: config,
                  isDragging: vm.isDragging,
                  biggest: constraints.biggest,
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                color: vm.isDragging ? Colors.transparent : Colors.white,
                height: double.maxFinite,
                width: double.maxFinite,
              ),
              DraggableTarget(
                targetSizeMultiplier: config.targetSizeMultiplier,
                primaryColor: config.primaryColor,
                setDragging: vm.setDragging,
                offsetListener: vm.setOffset,
              ),
              if (vm.isDragging)
                Positioned(
                  left: 40,
                  right: 40,
                  top: 40,
                  child: Container(
                    decoration: BoxDecoration(
                      color: config.primaryColor.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    alignment: Alignment.center,
                    child: Text(
                      vm.counter.toString(),
                      style: const TextStyle(
                        fontSize: 24.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
