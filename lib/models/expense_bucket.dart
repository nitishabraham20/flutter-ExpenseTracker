import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class ExpenseBucket {
  const ExpenseBucket({
    required this.category,
    required this.expenses,
  });

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;

    for (final expense in expenses) {
      sum += expense.amount; // sum = sum + expense.amount
    }

    return sum;
  }

  IconData get categoryIcon {
    switch (category) {
      case Category.food:
        return Icons.lunch_dining;
      case Category.travel:
        return Icons.flight_takeoff;
      case Category.leisure:
        return Icons.movie;
      case Category.work:
        return Icons.work;
    }
  }
}
