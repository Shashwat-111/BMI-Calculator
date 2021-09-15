import 'package:flutter/material.dart';

class Weight extends ChangeNotifier {
  int userWeight = 50;
  void addWeight()
  {
    userWeight++;
    notifyListeners();
  }

  void removeWeight()
  {
    userWeight--;
    notifyListeners();
  }

}

class Age extends ChangeNotifier {
  int age = 24;
  void addAge()
  {
    age++;
    notifyListeners();
  }

  void removeAge()
  {
    age--;
    notifyListeners();
  }

}

class BMI extends ChangeNotifier {
  int calculatedBMI = 0;

  void calculate()
  {
    calculatedBMI = 20;
    notifyListeners();
  }
}