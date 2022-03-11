import 'package:flutter/foundation.dart';

class Calculator with ChangeNotifier, DiagnosticableTreeMixin {
  double _startCurrency = 0;
  double _endCurrency = 0;
  double _amount = 0;
  double _interest = 0;
  int _month = 3;
  double _currencyDifference = 0;

  double get startCurrency => _startCurrency;
  double get endCurrency => _endCurrency;
  double get amount => _amount;
  double get interest => _interest;
  int get month => _month;

  void setStartCurrency(double value) {
    _startCurrency = value;
    updateCalculations();
    notifyListeners();
  }

  void setEndCurrency(double value) {
    _endCurrency = value;
    updateCalculations();
    notifyListeners();
  }

  void setAmount(double value) {
    _amount = value;
    updateCalculations();
    notifyListeners();
  }

  void setInterest(double value) {
    _interest = value;
    updateCalculations();
    notifyListeners();
  }

  void setMonth(int value) {
    _month = value;
    updateCalculations();
    notifyListeners();
  }

  updateCalculations() {
    calculateInterest();
    calculateCurrenceyDifference();
    calculateTotal();
  }

  calculateInterest() {
    double profit = 0;
    if (month == 3) {
      profit = _amount * ((_interest / 36500) * 92);
    } else {
      profit = _amount * ((_interest / 12) / 100) * _month;
    }
    return profit;
  }

  calculateCurrenceyDifference() {
    if (startCurrency == 0) return 0;
    var buyAmount = _amount / _startCurrency;
    var sellPrice = buyAmount * _endCurrency;
    _currencyDifference = sellPrice - _amount;
    return _currencyDifference;
  }

  calculateTotal() {
    debugPrint("fark:" + _currencyDifference.toStringAsFixed(2));
    if (_currencyDifference < calculateInterest()) {
      return amount + calculateInterest();
    } else {
      return amount + _currencyDifference;
    }
  }

  //to see debug toolsß
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty('sellCurrency', startCurrency));
    properties.add(DoubleProperty('buyCurrency', endCurrency));
  }
}
