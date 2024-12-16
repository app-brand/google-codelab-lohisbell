import 'package:codelab_training/codelabs/lab_eight/motion_router/motion_router.dart';
import 'package:flutter/material.dart';

class ReplyApp extends StatelessWidget {
  const ReplyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Material Motion - Codelab 8',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
          )),
      routerConfig: motionRouter,
    );
  }
}
