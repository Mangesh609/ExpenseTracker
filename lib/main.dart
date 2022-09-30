import 'package:flutter/material.dart';
import 'package:untitled/services/transaction.dart';
import 'package:untitled/widgets/add_transaction.dart';
import 'package:untitled/widgets/transactions_list.dart';
void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

 class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  List<Transaction> usertransactions = [
    Transaction(title: "Chocolate", amount: 20, dateTime: DateTime.now()),
  ];

  void addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        title: txTitle, amount: txAmount, dateTime: DateTime.now()
    );
    setState(() {
      usertransactions.add(newTx);
    });
  }
   startAddNewTransaction(ctx){
       showModalBottomSheet(context:ctx,builder:(_){
         return GestureDetector(
             child: NewTransaction(addNewTransaction),
             onTap: (){},
             behavior: HitTestBehavior.opaque,
         ) ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Expense Tracker"),
        centerTitle: true,
        actions: [
          IconButton(onPressed:()=>startAddNewTransaction(context),
              icon:Icon(Icons.add))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 50,
              width: 50,
              child: Center(child: Text("Chart")),
            ),
        TransactionList(transactions:usertransactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
          child: Icon(Icons.add),

          onPressed: (){
          startAddNewTransaction(context);
          }),

    );

  }
}
