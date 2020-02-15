import 'package:DinexDaddy/Classes/Database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class Sell extends StatelessWidget {
  String email;
  String name;
  Sell(String _email, String _name) {
    email = _email;
    name = _name;
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
                    email = val;
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
                    DatePicker.showDatePicker(context,
                      showTitleActions: true,
                      minTime: DateTime(2018, 3, 5),
                      maxTime: DateTime(2019, 6, 7), onChanged: (date) {
                        print('change $date');
                      }, onConfirm: (date) {
                        print('confirm $date');
                      }, currentTime: DateTime.now(), locale: LocaleType.zh
                    );
                    DataBase().addSeller(email, name, 
                      DateTime.now(), DateTime.now(), "Block");
                    Navigator.pushNamed(context, '/buy');
                  },
                  child: Text('Choose your end time'),
                ),
                RaisedButton(
                  onPressed: () {
                    DataBase().addSeller(email, name, 
                      DateTime.now(), DateTime.now(), "Block");
                    Navigator.pushNamed(context, '/buy');
                  },
                  child: Text('Block'),
                ),
                RaisedButton(
                  onPressed: () {
                    DataBase().addSeller(email, name, 
                      DateTime.now(), DateTime.now(), "Dinex");
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