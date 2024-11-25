import 'package:codelab_training/codelabs/lab_one/lab_one.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Unit test - to use cases.
  group('Use-cases Codelab #1 Tests', () {
    late LabOneState wordPairProvider;
    // GIVEN
    setUp(() {
      wordPairProvider = LabOneState();
    });
    test('Test-1 | Validando estados iniciales del Codelab #1', () {
      // Verifica que `current` tiene un valor inicial
      expect(wordPairProvider.current, isNotNull);
      // Verifica que la lista de favoritos está vacía
      expect(wordPairProvider.favorites, isEmpty);
    });
    test('getNext genera un nuevo WordPair', () {
      final initialWord = wordPairProvider.current;
      // Llama a getNext para generar un nuevo WordPair
      wordPairProvider.getNext();
      // Verifica que `current` haya cambiado
      expect(wordPairProvider.current, isNot(equals(initialWord)));
    });
  });
}
