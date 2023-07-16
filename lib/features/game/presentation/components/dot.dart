

import 'package:ballabash/features/game/domain/level_config.dart';
import 'package:ballabash/features/game/domain/level_config_worker.dart';
import 'package:flutter/material.dart';

import 'dot_position_generator.dart';

class Dot extends StatefulWidget {
  const Dot({
    super.key,
    required this.config,
    required this.biggest,
    required this.rectListener,
  });

  final LevelConfig config;
  final Size biggest;
  final void Function(RelativeRect) rectListener;

  @override
  State<Dot> createState() => DotState();
}

class DotState extends State<Dot> with SingleTickerProviderStateMixin {
  late final generator = DotPositionGenerator(
    maxX: widget.biggest.width,
    maxY: widget.biggest.height,
    objectSize: widget.config.dotSize,
  );

  late final color = widget.config.dotColor;

  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: Duration(milliseconds: widget.config.dotLifeInMilliseconds),
  )..forward();

  late final animation = RelativeRectTween(
    begin: RelativeRect.fromSize(
      generator.startPosition.rect,
      widget.biggest,
    ),
    end: RelativeRect.fromSize(
      generator.endPosition.rect,
      widget.biggest,
    ),
  ).animate(_controller);

  bool get isCompleted => _controller.isCompleted;

  @override
  void initState() {
    animation.addListener(
      () => widget.rectListener(animation.value),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = widget.config.dotSize;
    return PositionedTransition(
      rect: animation,
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size),
          color: color,
        ),
      ),
    );
  }
}
