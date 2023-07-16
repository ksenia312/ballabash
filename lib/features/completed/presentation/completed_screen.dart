import 'package:ballabash/features/game/router/game_route_arguments.dart';
import 'package:ballabash/router/router_utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CompletedScreen extends StatelessWidget {
  const CompletedScreen({super.key, required this.args});

  final GameRouteArguments args;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Level ${args.number} is done!',
                style: const TextStyle(fontSize: 32)),
            const SizedBox(height: 16),
            if (args.canNext(context))
              ElevatedButton(
                onPressed: () => context.push(
                  AppRoutes.game,
                  extra: args.next,
                ),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Go to the next',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: context.forcePop,
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Back to list',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
