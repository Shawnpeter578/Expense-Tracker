import 'package:exp_app/widgets/expensesList/expenses_item.dart';
import 'package:flutter/material.dart';
import 'package:exp_app/models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemovedExpense,
  });

  final List<Expense> expenses;
  final void Function(Expense expense) onRemovedExpense;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        onDismissed: (direnction) {
          onRemovedExpense(expenses[index]);
        },
        key: ValueKey(expenses[index]),
        background: Container(
          color: Colors.red.withValues(alpha: 0.75),
          margin: EdgeInsets.symmetric(
            horizontal: Theme.of(context).cardTheme.margin!.horizontal,
          ),
        ),
        child: ExpensesItem(expense: expenses[index]),
      ),
    );
  }
}
