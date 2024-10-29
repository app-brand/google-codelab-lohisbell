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
                subtitle: const Text('codelab #1 y #2'),
                onTap: () => {
                      routerCore.push('/labOne'),
                    }),
            ListTile(
              title: const Text('Sing in form'),
              subtitle: const Text('Codelab #3'),
              onTap: () => {
                routerCore.push('/labTwo'),
              },
            ),
            ListTile(
              title: const Text('Records and Patterns'),
              subtitle: const Text('Codelab #4'),
              onTap: () => {
                routerCore.push('/labFour'),
              },
            ),
            ListTile(
              title: const Text('Scrolling Expiriences'),
              subtitle: const Text('Codelab #5'),
              onTap: () => {
                routerCore.push('/labFive'),
              },
            ),
            ListTile(
              title: const Text('Using dev-tools'),
              subtitle: const Text('Codelab #6'),
              onTap: () => {
                routerCore.push('/labSix'),
              },
            ),
            ListTile(
              title: const Text('Implicit Animation'),
              subtitle: const Text('Codelab #7'),
              onTap: () => {
                routerCore.push('/labSeven'),
              },
            ),
            ListTile(
              title: const Text('Authentication using Firebase UI'),
              subtitle: const Text('Codelab #8'),
              onTap: () => {
                routerCore.push('/labEight'),
              },
            ),
            ListTile(
              title: const Text('Get to know flutter'),
              subtitle: const Text('Codelab #9'),
              onTap: () => {
                routerCore.push('/labNine'),
              },
            ),
            ListTile(
              title: const Text('Cloud Firestore Web Codelab'),
              subtitle: const Text('Codelab #10'),
              onTap: () => {
                routerCore.push('/labTen'),
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
