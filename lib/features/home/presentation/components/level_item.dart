import 'package:ballabash/features/game/router/game_route_arguments.dart';
import 'package:ballabash/app/domain/app_model.dart';
import 'package:ballabash/router/router_utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LevelItem extends StatelessWidget {
  const LevelItem({
    super.key,
    required this.number,
    required this.model,
  });

  final int number;
  final AppModel model;

  BorderRadius get radius => BorderRadius.circular(6.0);

  @override
  Widget build(BuildContext context) {
    final color = model.getHomeColor(number);
    return InkWell(
      onTap: model.isEnabled(number) ? () => onTap(context) : null,
      borderRadius: radius,
      highlightColor: color,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: radius,
          border: Border.all(
            color: color,
            width: 1.5,
          ),
        ),
        child: Center(
          child: Text(
            'LEVEL $number',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              color: color,
            ),
          ),
        ),
      ),
    );
  }

  void onTap(BuildContext context) {
    context.push(
      AppRoutes.game,
      extra: GameRouteArguments(number: number),
    );
  }
}
