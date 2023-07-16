import 'package:ballabash/router/router_utils.dart';
import 'package:flutter/material.dart';

import 'components/error_widget.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const AppErrorWidget(error: 'Unexpected error'),
            const SizedBox(height: 18),
            ElevatedButton(
              onPressed: context.forcePop,
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Back to list',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
