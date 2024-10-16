import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';


class RadialGauge extends StatelessWidget {
  const RadialGauge({super.key, required this.bmi});
  final double bmi;

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
        axes: <RadialAxis>[
          RadialAxis(minimum: 10,
              maximum: 40,
              ranges: <GaugeRange>[
                GaugeRange(
                    startValue: 10,
                    endValue: 17.5,
                    color: Colors.lightBlue,
                    startWidth: 10,
                    endWidth: 10),
                GaugeRange(
                    startValue: 17.5,
                    endValue: 25,
                    color: Colors.green,
                    startWidth: 10,
                    endWidth: 10),
                GaugeRange(
                    startValue: 25,
                    endValue: 30,
                    color: Colors.orange,
                    startWidth: 10,
                    endWidth: 10),
                GaugeRange(
                    startValue: 30,
                    endValue: 40,
                    color: Colors.red,
                    startWidth: 10,
                    endWidth: 10)
              ],
              pointers: <GaugePointer>[
                NeedlePointer(value: bmi)
              ],
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                    widget: Text(bmi.toStringAsFixed(2),
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold)),
                    angle: 90,
                    positionFactor: 0.5)
              ])
        ]);
  }
}
