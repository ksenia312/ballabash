import 'package:ballabash/app/domain/app_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class GameRouteArguments {
  GameRouteArguments({required this.number});

  final int number;

  bool canNext(BuildContext context) {
    final maxNumber = context.read<AppService>().state.data?.levelsCount;
    return maxNumber != null && number + 1 <= maxNumber;
  }

  GameRouteArguments get next => GameRouteArguments(
        number: number + 1,
      );
}
