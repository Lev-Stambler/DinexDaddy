import 'package:flutter/material.dart';

_confirmResult(bool isYes, BuildContext context) {
  if (isYes) {
    Text("Your transaction has been processed. You should have received an email");
  }

}

class ConfirmationDialog {
  var rating = 0.0;
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
                Text(description),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () => _confirmResult(true, context),
              child: Text("Confirm"),
            )
          ]
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

} 