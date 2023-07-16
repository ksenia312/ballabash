import 'package:ballabash/app/domain/app_service.dart';
import 'package:ballabash/app/utils/theme.dart';
import 'package:ballabash/di/service_locator.dart';
import 'package:ballabash/router/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => getIt<AppService>()..fetch(),
      child: MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.pink,
          textTheme: textTheme,
          elevatedButtonTheme: elevatedButtonTheme,
        ),
      ),
    );
  }
}
