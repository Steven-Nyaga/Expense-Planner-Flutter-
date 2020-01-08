import 'package:expense_planner/widgets/new_transaction.dart';
import 'package:expense_planner/widgets/transaction_list.dart';
import '../models/transaction.dart';
import 'package:flutter/material.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: '1', 
      title: 'New Shoes', 
      amount: 2500, 
      date: DateTime.now()
      ),
      Transaction(
      id: '2', 
      title: 'Suit', 
      amount: 4000, 
      date: DateTime.now()
      ),
  ];

  void _addNewTransaction(String txtitle, double txamount){
    final newTx = Transaction
    (title: txtitle, 
    amount: txamount, 
    date: DateTime.now(), 
    id:DateTime.now().toString() 
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactions)
      ],
    );
  }
}