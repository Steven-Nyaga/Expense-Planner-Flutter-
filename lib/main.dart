import 'package:expense_planner/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Planner'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text('chart'),
              elevation: 5,
            ),
          ),
          Column(
            children: transactions.map((tx){
              return Card(
                child: Row(
                  children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 10, 
                      horizontal: 15
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.purple,
                        width: 2,
                      )
                    ),
                    padding: EdgeInsets.all(10),
                    child: Text('KSH ${tx.amount}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.purple,
                    ),),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                    Text(tx.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),),
                    Text(
                      DateFormat('dd-MM-yyyy').format(tx.date),
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                    ),)
                  ],)
                ],),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
