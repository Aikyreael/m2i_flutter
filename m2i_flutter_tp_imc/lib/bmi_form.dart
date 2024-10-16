import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:m2i_flutter_tp_imc/body_mass_index.dart';
import 'package:m2i_flutter_tp_imc/radial_gauge.dart';

import 'bmi_calculator.dart';

class BMIForm extends StatefulWidget {
  const BMIForm({super.key, required this.title});

  final String title;

  @override
  State<BMIForm> createState() => _BMIFormState();
}

class _BMIFormState extends State<BMIForm> {
  final heightController = TextEditingController();
  final weightController = TextEditingController();

  int height = 0;
  int weight = 0;

  @override
  void initState() {
    super.initState();
    heightController.text = "0";
    weightController.text = "0";
    heightController.addListener(_refreshBMI);
    weightController.addListener(_refreshBMI);
  }

  void _refreshBMI() {
    height = int.parse(heightController.text);
    weight = int.parse(weightController.text);
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    BmiCalculator bmiCalculator = BmiCalculator();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
            width: 300,
            child: TextFormField(
              decoration: const InputDecoration(labelText: "Taille en cm"),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(3),
              ],
              controller: heightController,
            ),
          ),
            SizedBox(
              width: 300,
              child: TextFormField(
                decoration: const InputDecoration(labelText: "Poids en kg"),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(3),
                ],
                controller: weightController,
              ),
            ),
            if (weight > 0 && height > 0)... [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Catégorie IMC : "),
                  BodyMassIndex(height: height, weight: weight)
                ],
              ),
              RadialGauge(bmi: bmiCalculator.calculBMI(height, weight)),
            ],
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    heightController.dispose();
    weightController.dispose();
    super.dispose();
  }
}

