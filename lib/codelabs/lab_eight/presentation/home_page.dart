import 'package:codelab_training/codelabs/lab_eight/motion_router/motion_router.dart';
import 'package:codelab_training/presentation/core/router_core.dart';
import 'package:flutter/material.dart';

class HomePageEight extends StatefulWidget {
  const HomePageEight({super.key});

  @override
  State<HomePageEight> createState() => _HomePageEightState();
}

class _HomePageEightState extends State<HomePageEight> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            routerCore.pop();
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text('Codelab #8'),
      ),
      body: Center(
        child: ElevatedButton.icon(
          icon: const Icon(Icons.search),
          label: const Text('Ir a búsqueda'),
          onPressed: () {
            motionRouter.push('/search');
          },
        ),
      ),
    );
  }
}
