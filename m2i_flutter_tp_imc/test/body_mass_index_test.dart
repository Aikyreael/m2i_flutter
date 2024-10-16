// File: test/body_mass_index_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:m2i_flutter_tp_imc/bmi_calculator.dart';
import 'package:m2i_flutter_tp_imc/body_mass_index.dart';

void main() {
  group('BodyMassIndex calculations', () {
    test('Calcule l\'IMC correct ', () {
      BmiCalculator bmiCalculator = BmiCalculator();

      const int height = 170;
      const int weight = 70;

      const double expectedBMI = 24.22;

      final double bmi = bmiCalculator.calculBMI(height, weight);

      expect(bmi, closeTo(expectedBMI, 0.01));
    });

    test('return l\'IMC correct pour la catégorie underweight', () {
      const bodyMassIndex = BodyMassIndex(height: 0, weight: 0);
      expect(bodyMassIndex.bmiToCategories(17.0), 'underweight');
    });

    test('return l\'IMC correct pour la catégorie normal', () {
      const bodyMassIndex = BodyMassIndex(height: 0, weight: 0,);
      expect(bodyMassIndex.bmiToCategories(24.0), 'Normal');
    });

    test('return l\'IMC correct pour la catégorie overweight', () {
      const bodyMassIndex = BodyMassIndex(height: 0, weight: 0,);
      expect(bodyMassIndex.bmiToCategories(27.0), 'Overweight');
    });

    test('return l\'IMC correct pour la catégorie obese', () {
      const bodyMassIndex = BodyMassIndex(height: 0, weight: 0,);
      expect(bodyMassIndex.bmiToCategories(31.0), 'Obese');
    });
  });
}
