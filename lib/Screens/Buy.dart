import 'package:DinexDaddy/Screens/BuyerMatch.dart';
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
    Color PrimaryColor = const Color(0xFFB71C1C);
    return Scaffold(
      appBar: AppBar(
        title: Text("Buyer Homepage"),
        backgroundColor: PrimaryColor,
      ),
      body: Center(
        
          child: Column (
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget> [
          Container(
              height: 180,
              width: 180,
              child: Image.asset('lib/images/logo.png'),
              padding: EdgeInsets.only(bottom: 50),
              ),  
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
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => BuyerMatch(availbleStart, availbleEnd)
              ));
              // Navigate back to confirm transaction
            },
            child: Text('Submit'),
          ),
          ]
        ),
    ));
  } 
}
