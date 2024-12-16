import 'package:codelab_training/codelabs/lab_eight/motion_router/motion_router.dart';
import 'package:flutter/material.dart';

class SearchPageEight extends StatefulWidget {
  const SearchPageEight({super.key});

  @override
  State<SearchPageEight> createState() => _SearchPageEightState();
}

class _SearchPageEightState extends State<SearchPageEight> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => motionRouter.pop(),
        ),
      ),
      body: const Center(
        child: Text('Página de búsqueda'),
      ),
    );
  }
}
