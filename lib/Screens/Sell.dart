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
                RaisedButton(
                  onPressed: () {
                    Seller s  = new Seller(name, email, price, availbleStart, availbleEnd, "Block");
                    DataBase().addSeller(s);
                    Navigator.pushNamed(context, '/buy');
                  },
                  child: Text('Block'),
                ),
                RaisedButton(
                  onPressed: () {
                    print(name);
                    Seller s  = new Seller(name, email, price, availbleStart, availbleEnd, "Dinex");
                    DataBase().addSeller(s);
                    Navigator.pushNamed(context, '/sell');
                  },
                  child: Text('Dinex'),
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