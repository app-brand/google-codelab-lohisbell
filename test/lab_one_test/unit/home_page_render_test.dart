import 'package:codelab_training/presentation/core/home_core.dart';
import 'package:codelab_training/presentation/core/state_core.dart';
import 'package:codelab_training/presentation/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
/* import 'package:flutter/material.dart';
import 'package:codelab_training/main.dart'; */
import 'package:provider/provider.dart';

void main() {
  testWidgets('HomeCore renders correctly', (WidgetTester tester) async {
    // GIVEN
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (context) => ApplicationState(),
        builder: ((context, child) => const HomeCore()),
      ),
    );
    // WHEN AND THEN
    expect(find.text('Codelab Training 2.0'), findsOneWidget);
  });
}
