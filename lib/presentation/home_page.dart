import 'package:codelab_training/presentation/core/router_core.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            ListTile(
                title: const Text('Namer app'),
                subtitle: const Text('codelab #1'),
                onTap: () => {
                      routerCore.push('/labOne'),
                    }),
            ListTile(
              title: const Text('Sing in form'),
              subtitle: const Text('Codelab #2'),
              onTap: () => {
                routerCore.push('/labTwo'),
              },
            ),
            ListTile(
              title: const Text('lab #3'),
              subtitle: const Text('Cambia fondo #3'),
              onTap: () => {
                routerCore.push('/labThree'),
              },
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.blue,
      ),
    );
  }
}
