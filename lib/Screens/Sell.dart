import 'package:DinexDaddy/Classes/Database.dart';
import 'package:DinexDaddy/Classes/Seller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';


class Sell extends StatefulWidget {
  Sell() {
    // email = _email;
    // name = _name;
    // price = 8.0;
  }
  @override
  _Sell createState() {
    return _Sell();
  }
}
class _Sell extends State {
  String email;
  double price;
  String name;
  List<bool> _selections = [false,false];

  var selectedRange = RangeValues(6,18);
  DateTime availbleEnd;
  DateTime availbleStart;
  _Sell() {
    availbleStart = new DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day,
                                selectedRange.start.round());
    availbleEnd = new DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day,
                                selectedRange.end.round());
    price = 7.5;
  }
 @override
  Widget build(BuildContext context) {
    Color PrimaryColor = const Color(0xFFB71C1C);
    return Scaffold(
      appBar: AppBar(
        title: Text("Dinex Daddy"),
        backgroundColor: PrimaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
              Container(
              height: 180,
              width: 180,
              child: Image.asset('lib/images/logo.png'),
              padding: EdgeInsets.only(bottom: 50),
              ),    
              new Container(
                width: 300.0,
                margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                child:
                new TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter email'
                  ),
                  onChanged: (String val) {
                    setState(() {
                      email = val;
                    });
                  },
                ),
              ),
              new Container(
                width: 300.0,
                margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: new
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter name'
                    ),
                    onChanged: (String val) {
                      name = val;
                    },
                  ),
                ),
                new Container(
                  width: 500.0,
                  child: Column(children: <Widget>[
                    Text("Choose your price: (For one block or \$5 of Dinex)"),
                    Slider( 
                      value: price,
                      onChanged: 
                      (newPrice) {
                        setState(() {
                          price = newPrice;
                      });
                      },
                      divisions: 40,
                      label: '\$${price}',
                      max: 20.0,
                      min: 0.0,),
                    Text("Choose your preferred time range:"),
                    RangeSlider(
                      values: selectedRange,
                      min: 0,
                      max: 24,
                      labels: RangeLabels("${selectedRange.start}:00","${selectedRange.end}:00"),
                      onChanged: (RangeValues newRange) {
                        setState(() {
                          selectedRange = newRange;
                          availbleStart = new DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day,
                                                     selectedRange.start.round());
                          availbleEnd = new DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day,
                                                     selectedRange.end.round());
                        });
                      },
                      semanticFormatterCallback: (RangeValues rangeValues) {
                        return '${rangeValues.start.round()} - ${rangeValues.end.round()}  dollars';
                      },
                      divisions: 24,
                          ),
                  ],),
                ),
                Column(children: <Widget>[
                  Text("Select either Dinex or Blocks to sell"),
                  ToggleButtons(
                  children: [
                    Icon(Icons.attach_money),
                    Icon(Icons.fastfood),
                  ],
                  isSelected: _selections,
                  
                  onPressed: (int index) {
                    setState(() {
                      for (int buttonIndex = 0; buttonIndex < _selections.length; buttonIndex++) {
                        if (buttonIndex == index) {
                        _selections[buttonIndex] = !_selections[buttonIndex];
                        } else {
                          _selections[buttonIndex] = false;
                        }
                      } 
                    });
                  }
                ),
                ],),
              RaisedButton(
                onPressed: () {
                  String typeUsed = _selections[0] ? "Dinex" : "Block";
                  Seller s  = new Seller(name, email, price, availbleStart, availbleEnd, typeUsed);
                  DataBase().addSeller(s);
                  showAlertDialog(context);
                },
                child: Text('Submit'),
              ),
              ]
            ),
            // Row (
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: <Widget>[
            //   ],
            // )

          ],
        ) 
      ),
    );
  } 
}

showAlertDialog(BuildContext context) {

  // set up the button
Widget okButton = FlatButton(
  child: Text("OK"),
  onPressed: () {
    Navigator.pop(context);
   },
);

// set up the AlertDialog
AlertDialog alert = AlertDialog(
  title: Text("Confirmation"),
  content: Text("Congrats! You are now a listed seller"),
  actions: [
    okButton,
  ],
  
);

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}