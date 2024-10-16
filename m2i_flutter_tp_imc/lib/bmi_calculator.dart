class BmiCalculator {

  double calculBMI(int heightInCM, int weight) {
    double heightInMeter = heightInCM / 100;
    return weight / (heightInMeter * heightInMeter);
  }
}