import 'package:codelab_training/codelabs/lab_five/lab_five.dart';
import 'package:codelab_training/codelabs/lab_four/lab_four.dart';
import 'package:codelab_training/codelabs/lab_one/lab_one.dart';
import 'package:codelab_training/codelabs/lab_six/lab_six.dart';
import 'package:codelab_training/codelabs/lab_two/lab_two.dart';
import 'package:codelab_training/presentation/home_page.dart';
import 'package:go_router/go_router.dart';

final routerCore = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: '/labOne',
      builder: (context, state) => LabOne(),
    ),
    GoRoute(
      path: '/labTwo',
      builder: (context, state) => LabTwo(),
    ),
    GoRoute(
      path: '/WelcomelabTwo',
      builder: (context, state) => WelcomeScreen(),
    ),
    GoRoute(
      path: '/labFour',
      builder: (context, state) => DocumentApp(),
    ),
    GoRoute(
      path: '/labFive',
      builder: (context, state) => LabFive(),
    ),
    GoRoute(
      path: '/labSix',
      builder: (context, state) => Menu(),
    )
  ],
);
