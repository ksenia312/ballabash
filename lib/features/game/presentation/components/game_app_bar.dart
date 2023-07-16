import 'package:ballabash/app/domain/app_state.dart';
import 'package:ballabash/features/game/domain/level_config.dart';
import 'package:ballabash/features/game/domain/level_config_worker.dart';
import 'package:ballabash/router/router_utils.dart';
import 'package:flutter/material.dart';

class GameAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GameAppBar({
    super.key,
    required this.state,
    required this.level,
    required this.counter,
  });

  final AppState<LevelConfig> state;
  final int level;
  final int counter;

  @override
  Size get preferredSize => AppBar().preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: state.data.primaryColor,
      leading: IconButton(
        onPressed: context.backHome,
        icon: const Icon(Icons.arrow_back_ios_new),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: buildTitle(context, 'Level $level'),
          ),
          state.buildWhen(
            onData: (config) => buildTitle(
              context,
              'Goal: ${config.doneValue}',
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTitle(BuildContext context, String value) {
    return Text(
      value,
      style: const TextStyle(fontSize: 20),
    );
  }
}
