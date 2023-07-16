import 'dart:math';

import 'package:flutter/material.dart';

import 'target.dart';

class DraggableTarget extends StatefulWidget {
  const DraggableTarget({
    super.key,
    required this.setDragging,
    required this.offsetListener,
    required this.targetSizeMultiplier,
    required this.primaryColor,
  });

  final ValueChanged<bool> setDragging;
  final ValueChanged<Offset> offsetListener;
  final double targetSizeMultiplier;
  final Color primaryColor;

  @override
  State<DraggableTarget> createState() => _DraggableTargetState();
}

class _DraggableTargetState extends State<DraggableTarget> {
  late Offset offset = MediaQuery.sizeOf(context).center(
    Offset(
      -targetSize / 2,
      -targetSize,
    ),
  );

  late double x = offset.dx;
  late double y = offset.dy;

  double get maxX => MediaQuery.sizeOf(context).width - targetSize;

  double get maxY =>
      MediaQuery.sizeOf(context).height -
      View.of(context).viewPadding.bottom -
      targetSize;

  double get targetSize =>
      MediaQuery.sizeOf(context).width * widget.targetSizeMultiplier;

  double get minX => 0;

  double get minY => 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget.offsetListener(offset);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          top: y,
          left: x,
          child: Draggable(
            feedback: Target(
              primaryColor: widget.primaryColor,
              colored: false,
              size: targetSize,
            ),
            childWhenDragging: const SizedBox(),
            onDragStarted: () {
              widget.setDragging(true);
            },
            onDragUpdate: (details) {
              setState(() {
                offset += details.delta;
              });
              widget.offsetListener(offset);
            },
            onDragEnd: (details) {
              widget.setDragging(false);
              final positionX = details.offset.dx;
              final positionY =
                  details.offset.dy - View.of(context).viewPadding.bottom;
              setState(
                () {
                  x = min(max(minX, positionX), maxX);
                  y = min(max(minY, positionY), maxY);
                  offset = Offset(x, y);
                },
              );
            },
            child: Target(
              primaryColor: widget.primaryColor,
              colored: true,
              size: targetSize,
            ),
          ),
        ),
      ],
    );
  }
}
