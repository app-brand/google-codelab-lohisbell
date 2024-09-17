import 'package:codelab_training/presentation/core/router_core.dart';
import 'package:flutter/material.dart';
import 'dart:math';

const owlUrl =
    'https://raw.githubusercontent.com/flutter/website/main/src/content/assets/images/docs/owl.jpg';

double randomBorderRadius() {
  return Random().nextDouble() * 64;
}

double randomMargin() {
  return Random().nextDouble() * 64;
}

Color randomColor() {
  return Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));
}

class FadeInDemo extends StatefulWidget {
  const FadeInDemo({super.key});

  @override
  State<FadeInDemo> createState() => _FadeInDemoState();
}

class _FadeInDemoState extends State<FadeInDemo> {
  double opacity = 0;
  late Color color;
  late double borderRadius;
  late double margin;
  @override
  void initState() {
    super.initState();
    color = randomColor();
    borderRadius = randomBorderRadius();
    margin = randomMargin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        leading: IconButton(
          onPressed: () {
            routerCore.pop();
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: ListView(children: <Widget>[
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(owlUrl),
            TextButton(
              child: const Text(
                'Show Details',
                style: TextStyle(color: Colors.blueAccent),
              ),
              onPressed: () => {
                setState(() {
                  if (opacity == 0) {
                    opacity = 1;
                  } else {
                    opacity = 0;
                  }
                })
              },
            ),
            AnimatedOpacity(
              opacity: opacity,
              duration: const Duration(seconds: 2),
              child: const Column(
                children: [
                  Text('Type: Owl'),
                  Text('Age: 39'),
                  Text('Employment: None'),
                ],
              ),
            ),
            SizedBox(
              width: 128,
              height: 128,
              child: AnimatedContainer(
                duration: const Duration(seconds: 3),
                margin: EdgeInsets.all(margin),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),
            ),
            ElevatedButton(
              child: const Text('Change'),
              onPressed: () => {
                setState(() {
                  color = randomColor();
                  borderRadius = randomBorderRadius();
                  margin = randomMargin();
                })
              },
            ),
          ],
        )
      ]),
    );
  }
}
