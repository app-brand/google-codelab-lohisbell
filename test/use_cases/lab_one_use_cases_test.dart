import 'package:codelab_training/codelabs/lab_one/lab_one.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Use-cases Codelab #1 Tests', () {
    late LabOneState wordPairProvider;
    // GIVEN
    setUp(() {
      wordPairProvider = LabOneState();
    });
    test('Validando estados iniciales del Codelab #1', () {
      // Verifica que `current` tiene un valor inicial
      expect(wordPairProvider.current, isNotNull);
      // Verifica que la lista de favoritos está vacía
      expect(wordPairProvider.favorites, isEmpty);
    });
  });
}
