import 'package:flutter/material.dart';

class Target extends StatelessWidget {
  const Target({
    super.key,
    required this.colored,
    required this.size,
    required this.primaryColor,
  });

  final bool colored;
  final double size;
  final Color primaryColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        border: !colored ? Border.all(color: primaryColor, width: 3) : null,
        borderRadius: BorderRadius.circular(size),
        color: colored ? primaryColor : Colors.white10,
      ),
      child: colored
          ? Center(
              child: Text(
                'Drag to start',
                style: TextStyle(
                  fontSize: size / 10,
                  color: Colors.white,
                ),
              ),
            )
          : null,
    );
  }
}
