import 'package:DinexDaddy/Classes/Database.dart';
import 'package:DinexDaddy/Classes/Seller.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Dinex Daddy"),
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
                    Text("Choose your price:"),
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
                ToggleButtons(
                children: [
                  Icon(Icons.attach_money),
                  Icon(Icons.add_box),
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
              RaisedButton(
                onPressed: () {
                  //list for sale
                }
              )
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