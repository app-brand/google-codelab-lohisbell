//
import 'package:codelab_training/presentation/core/router_core.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LabOne extends StatelessWidget {
  const LabOne({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LabOneState(),
      child: LabOnePage(),
    );
  }
}

class LabOneState extends ChangeNotifier {
  var current = WordPair.random();
  var favorites = <WordPair>[];

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  void removeFavorite(WordPair sure) {
    favorites.remove(sure);
    notifyListeners();
  }

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }
}

class LabOneGenerator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<LabOneState>();
    IconData icon;
    if (appState.favorites.contains(appState.current)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('A random AWESOME idea:'),
            BigCard(appState: appState),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    appState.toggleFavorite();
                  },
                  icon: Icon(icon),
                  label: Text('Like'),
                ),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    appState.getNext();
                  },
                  child: Text('Next'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LabOneFavorites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<LabOneState>();
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('My Favorites...'),
            SizedBox(
              height: 10,
            ),
            for (var favorit in appState.favorites)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${favorit.first} ${favorit.second}"),
                  TextButton(
                      onPressed: () {
                        appState.removeFavorite(favorit);
                      },
                      child: Icon(
                        Icons.favorite,
                      ))
                ],
              ),
          ]),
        ),
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.appState,
  });
  final LabOneState appState;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          "${appState.current.first} ${appState.current.second}",
          style: style,
        ),
      ),
    );
  }
}

class LabOnePage extends StatefulWidget {
  @override
  State<LabOnePage> createState() => _LabOnePageState();
}

class _LabOnePageState extends State<LabOnePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = LabOneGenerator();
        break;
      case 1:
        page = LabOneFavorites();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SafeArea(
          child: NavigationRail(
            backgroundColor: Colors.amber,
            extended: true,
            destinations: [
              NavigationRailDestination(
                icon: Icon(Icons.home),
                label: Text('Home'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.favorite),
                label: Text('Favorites'),
              ),
            ],
            selectedIndex: selectedIndex, // ← Change to this.
            onDestinationSelected: (value) {
              // ↓ Replace print with this.
              setState(() {
                selectedIndex = value;
              });
            },
          ),
        ),
        Expanded(
          child: Container(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: page,
          ),
        ),
      ],
    );
  }
}
