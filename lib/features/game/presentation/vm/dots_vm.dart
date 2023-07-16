import 'dart:async';

import 'package:ballabash/features/game/presentation/components/dot.dart';
import 'package:flutter/cupertino.dart';

class DotsVM extends ChangeNotifier {
  DotsVM(this.milliseconds);

  final List<GlobalKey<DotState>> dotsKeys = [];

  Timer? timer;
  final int milliseconds;

  void startTimer() {
    timer = Timer.periodic(
      Duration(milliseconds: milliseconds),
      (_) {
        dotsKeys.add(GlobalKey<DotState>());
        for (final key in _getCompleted()) {
          dotsKeys.remove(key);
        }
        notifyListeners();
      },
    );
  }

  @override
  void dispose() {
    close();
    super.dispose();
  }

  void close() {
    dotsKeys.clear();
    timer?.cancel();
    timer = null;
  }

  List<GlobalKey<DotState>> _getCompleted() {
    return List<GlobalKey<DotState>>.from(
      dotsKeys.where(
        (e) => e.currentState?.isCompleted ?? false,
      ),
    );
  }
}
