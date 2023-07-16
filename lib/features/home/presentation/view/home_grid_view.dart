import 'package:ballabash/app/domain/app_service.dart';
import 'package:ballabash/features/not_found/components/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/level_item.dart';

class HomeGridView extends StatelessWidget {
  const HomeGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppService>(
      builder: (context, service, _) {
        return service.state.buildWhen(
          inProgress: (_) => const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
          onError: (_, error) {
            return AppErrorWidget(
              error: error is String ? error : 'Something went wrong',
            );
          },
          onData: (data) {
            return GridView.count(
              crossAxisCount: MediaQuery.sizeOf(context).width ~/ 150,
              padding: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 20.0,
              ),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 3,
              children: List.generate(
                data.levelsCount,
                (index) => LevelItem(number: index + 1, model: data),
              ),
            );
          },
        );
      },
    );
  }
}
