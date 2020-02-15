import 'package:DinexDaddy/Classes/Database.dart';
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
  _Sell() {
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
                RaisedButton(
                  onPressed: () {
                    DatePicker.showTimePicker(context,
                      showTitleActions: true,
                      // minTime: DateTime.now(),
                      // maxTime: DateTime(2021),
                      onChanged: (date) {
                        print('change $date');
                      }, onConfirm: (date) {
                        availbleEnd = date;
                        print('confirm $date');
                      }, currentTime: DateTime.now(), locale: LocaleType.en
                    );
                  },
                  child: Text('Choose your end time'),
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
                        setState(() => selectedRange = newRange);
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
                    DataBase().addSeller(email, name, 
                      DateTime.now(), availbleEnd, "Block", price);
                    Navigator.pushNamed(context, '/buy');
                  },
                  child: Text('Block'),
                ),
                RaisedButton(
                  onPressed: () {
                    DataBase().addSeller(email, name, 
                      DateTime.now(), availbleEnd, "Dinex", price);
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