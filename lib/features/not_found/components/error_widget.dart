import 'package:flutter/material.dart';

class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget({super.key, required this.error});

  final String error;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red, width: 2),
        borderRadius: BorderRadius.circular(6.0)
      ),
      padding: const EdgeInsets.all(8.0),
      child: Text(
        error,
        style: const TextStyle(
          fontSize: 24,
          color: Colors.red,
        ),
      ),
    );
  }
}
