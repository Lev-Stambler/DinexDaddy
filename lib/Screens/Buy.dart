import 'package:flutter/material.dart';
class Buy extends StatefulWidget {

 var selectedRange = RangeValues(6,18);
 Buy() {
    // email = _email;
    // name = _name;
    // price = 8.0;
  }
  @override
  _Buy createState() {
    return _Buy();
  }
}

 class _Buy extends State {

  var selectedRange = RangeValues(6,18);
  DateTime availbleEnd;
  DateTime availbleStart;
  _Buy() {
    availbleStart = new DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day,
                                selectedRange.start.round());
    availbleEnd = new DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day,
                                selectedRange.end.round());

  }
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buyer Homepage"),
      ),
      body: Center(
        
          child: Column (
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget> [
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
            
            divisions: 24,
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/buyer-match');
              // Navigate back to confirm transaction
            },
            child: Text('Buy'),
          ),
          ]
        ),
    ));
  } 
}
