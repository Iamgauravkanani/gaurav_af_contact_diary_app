import 'package:af_6/Models/counter_model.dart';
import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  Counter counter = Counter(cnt: 0);

  void incrementCounter() {
    counter.cnt++;
    notifyListeners();
  }
}
