// lib/router.dart
import 'package:codelab_training/codelabs/lab_eight/presentation/home_page.dart';
import 'package:codelab_training/codelabs/lab_eight/presentation/search_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final motionRouter = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePageEight(),
    ),
    GoRoute(
      path: '/search',
      builder: (context, state) => const SearchPageEight(),
    ),
  ],
);
