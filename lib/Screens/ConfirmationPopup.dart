import 'package:flutter/material.dart';


class ConfirmationDialog {
  confirm(BuildContext context, String title, String description) {
    return showDialog (
      context: context,
      //barrierDismissable: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(description)
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              //onPressed: () => confirmResult(),
              child: Text("cancel"),

            )
          ]
        );
      }
    );
  }

} 