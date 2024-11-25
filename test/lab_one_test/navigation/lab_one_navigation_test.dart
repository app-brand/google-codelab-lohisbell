import 'package:codelab_training/presentation/core/home_core.dart';
import 'package:codelab_training/presentation/core/state_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('Navigation Codelab #1 correctly', (WidgetTester tester) async {
    // GIVEN
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (context) => ApplicationState(),
        builder: ((context, child) => const HomeCore()),
      ),
    );
    // WHEN
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();
    //expect(find.text('Codelab #1 y #2'), findsOneWidget);
    await tester.tap(find.text('Codelab #1 y #2'));
    await tester.pumpAndSettle();
    // THEN
    expect(find.text('A random AWESOME idea:'), findsOneWidget);
  });
}
