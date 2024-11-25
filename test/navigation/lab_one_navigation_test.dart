import 'package:codelab_training/presentation/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Navigation Codelab #1 correctly', (WidgetTester tester) async {
    // GIVEN
    await tester.pumpWidget(
      MaterialApp(
        home: HomePage(),
      ),
    );
    // WHEN
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();
    expect(find.byType(Drawer), findsOneWidget);
    //expect(find.text('Codelab #1'), findsOneWidget);
    await tester.tap(find.text('Codelab #1'));
    await tester.pumpAndSettle();
    // THEN
    expect(find.text('A random AWESOME idea:'), findsOneWidget);
  });
}
