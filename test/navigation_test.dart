import 'package:codelab_training/presentation/core/home_core.dart';
import 'package:codelab_training/presentation/core/state_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:codelab_training/main.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('HomeCore renders correctly', (WidgetTester tester) async {
    // Arranque - GIVEN
    // Dado esta logica de arranque.
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => ApplicationState(),
        child: const HomeCore(),
      ),
    );
    // WHEN AND THEN - Verifica si hay un widget clave, como un título o botón.
    expect(find.text('Codelab Training 1.0'), findsOneWidget);
  });
}
