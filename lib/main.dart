import 'package:expense_planner/widgets/new_transaction.dart';
import 'package:expense_planner/widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import './models/transaction.dart';
import './widgets/transaction_list.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
  void _startAddNewTransaction(BuildContext ctx){
    showModalBottomSheet(context: ctx,
    builder: (_) {
      return GestureDetector(
        onTap:() {},
        child: NewTransaction(_addNewTransaction),
        behavior: HitTestBehavior.opaque,
        );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),)
        ],
        title: Text('Expense Planner'),
      ),
      body: SingleChildScrollView(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                      width: double.infinity,
                      child: Card(
                        color: Colors.blue,
                        child: Text('chart'),
                        elevation: 5,
                      ),
                  ),
                  TransactionList(_userTransactions)
                ],
              ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),),
    );
  }
}
