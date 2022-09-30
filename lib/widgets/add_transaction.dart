import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class NewTransaction extends StatefulWidget {
  final Function addTx;
  NewTransaction(this.addTx);
  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  late TextEditingController titleController = TextEditingController();
  late TextEditingController amountController= TextEditingController();

 submitData(){
   var a = titleController.text.toString();
   var b  = double.parse(amountController.text);
   if (a==null||b<0){
     return;
   }
   else {
     Navigator.of(context).pop();
   }
}

@override

  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              controller:titleController,
              decoration: InputDecoration(
                labelText:"Title",
              ),
              keyboardType: TextInputType.text,
            ),
            TextField(
              controller:amountController,
              decoration: InputDecoration(
                labelText:"Amount",
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height:10 ,),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                ),
                onPressed: (){
                  widget.addTx(titleController.text,double.parse(amountController.text));
                  submitData();
                },
                child: Text("Add Transaction")
            )
          ],
        ),
      ),
    );
  }
}
