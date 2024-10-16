import 'package:flutter/material.dart';
import 'package:m2i_flutter_tp_imc/bmi_calculator.dart';

class BodyMassIndex extends StatelessWidget{
  const BodyMassIndex({super.key, required this.height, required this.weight});

  final int height;
  final int weight;

  String bmiToCategories(double bmi) {
    String bmiCategories;

    if(bmi < 18.5) {
      bmiCategories = "underweight";
    } else if (bmi <= 25) {
      bmiCategories = "Normal";
    } else if (bmi <= 30) {
      bmiCategories = "Overweight";
    } else {
      bmiCategories = "Obese";
    }

    return bmiCategories;
  }

  @override
  Widget build(BuildContext context) {
    BmiCalculator bmiCalculator = BmiCalculator();

    return Text(
        style: Theme.of(context).textTheme.headlineMedium,
        bmiToCategories(bmiCalculator.calculBMI(height, weight)),
    );
  }
}
