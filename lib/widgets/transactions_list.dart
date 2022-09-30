import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../services/transaction.dart';



class TransactionList extends StatelessWidget {

  late List<Transaction> transactions;
  TransactionList({required this.transactions});

  @override
  Widget build(BuildContext context) {
    late MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    double screenWidth = queryData.size.width ;
    return SingleChildScrollView(
      child: Column(
        children: transactions.map((tx) {
          return Card(
            elevation: 1,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(tx.title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                          fontSize: screenWidth/23,
                        ),),
                      SizedBox(height:10,),
                      Text(DateFormat().add_yMMMd().format(tx.dateTime),
                      style:TextStyle(
                        color: Colors.black45,
                        fontSize:screenWidth/28,
                      ) ,
                      ),
                    ],
                  ),
                  SizedBox(width:screenWidth*0.41),
                  Text("—  ₹ " + tx.amount.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: screenWidth/22,
                      color: Colors.redAccent,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
        ),
    );
  }
}