import 'dart:convert';

import 'package:ecogrand_bank/data/enums/income_type.dart';
import 'package:ecogrand_bank/data/models/income.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _incomesKey = 'incomesKey';

class IncomesController extends ChangeNotifier {
  IncomesController(this._pr) {
    _init();
  }
  final SharedPreferences _pr;

  List<Income> _myIncomes = [];
  List<Income> get incomes => _myIncomes;

  int sum([IncomeType? type]) {
    var sum = 0;

    for (var income in _myIncomes) {
      if (type == null) {
        sum += income.amount;
      } else {
        if (income.type == type) {
          sum += income.amount;
        }
      }
    }
    return sum;
  }

  void _init() {
    final json = _pr.getString(_incomesKey) ?? '';
    if (json.isEmpty) {
      return;
    }

    final list = jsonDecode(json) as List<dynamic>;

    final incomes = list.map((e) => Income.fromJson(e)).toList();

    _myIncomes = incomes;
    notifyListeners();
  }

  void addIncome(Income income) {
    _myIncomes.add(income);
    _cacheIncomes();
    notifyListeners();
  }

  void _cacheIncomes() {
    final json = jsonEncode(_myIncomes.map((e) => e.toJson()).toList());
    _pr.setString(_incomesKey, json);
  }
}
