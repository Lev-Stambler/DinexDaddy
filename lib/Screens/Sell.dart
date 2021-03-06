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
  String dropdownValue = '(No Preference)';
  List<bool> _selections = [false,false];
  bool _validate = true;
  bool _validate2 = true;
  var _text = TextEditingController(); 
  var _text2 = TextEditingController(); 

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
  void dispose() {
    _text.dispose();
    super.dispose();
  }

 @override
  Widget build(BuildContext context) {
    Color PrimaryColor = const Color(0xFFB71C1C);
    return Scaffold(
      appBar: AppBar(
        title: Text("Seller Homepage"),
        backgroundColor: PrimaryColor,
      ),
      body: Container(
        child: Center(
          child: 
        ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(15.0),
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
              Container(
              height: 150,
              width: 150,
              child: Image.asset('lib/images/logo.png'),
              padding: EdgeInsets.only(bottom: 50),
              ),    
              new Container(
                width: 300.0,
                margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                child:
                new TextField(
                  controller: _text2,
                  decoration: InputDecoration(
                    errorText: !_validate2 ? 'Email Can\'t Be empty' : null,
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
                    controller: _text,
                    decoration: InputDecoration(
                      errorText: !_validate ? 'Name Can\'t Be empty' : null,
                      border: OutlineInputBorder(),
                      hintText: 'Enter name'
                    ),
                    onChanged: (String val) {
                      name = val;
                    },
                  ),
                ),
                DropdownButton<String>(
                  value: dropdownValue,
                  icon: Icon(Icons.place),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(
                    color: PrimaryColor
                  ),
                  underline: Container(
                    height: 2,
                    color: PrimaryColor,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items: <String>['(No Preference)','CUC', 'Tepper', 'Resnik', 'Entropy','UG', 'Wean', 'NSH', 'Posner']
                    .map<DropdownMenuItem<String>>((String _value) {
                      return DropdownMenuItem<String>(
                        value: _value,
                        child: Text(_value),
                      );
                    })
                    .toList(),
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
                      semanticFormatterCallback: (double val) {
                        return '${val} dollars';
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
                  setState(() {
                  _text.text.isEmpty ? _validate = false : _validate = true;
                  _text2.text.isEmpty ? _validate2 = false : _validate2 = true;
                  });
                  if (_validate && _validate2) {
                    String typeUsed = _selections[0] ? "Dinex" : "Block";
                    Seller s  = new Seller(name, email, price, availbleStart, availbleEnd, typeUsed, dropdownValue);
                    DataBase().addSeller(s);
                    showAlertDialog(context);
                  }
                  else{

                  }
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