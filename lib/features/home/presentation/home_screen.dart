import 'package:ballabash/app/domain/app_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view/home_grid_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<AppService>().fetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BALLABASH'),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.only(top: 16.0),
          child: HomeGridView(),
        ),
      ),
    );
  }
}
