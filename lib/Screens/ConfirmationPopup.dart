import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';


_confirmResult(bool isYes, BuildContext context) {
  if (isYes) {
    Text("Your transaction has been processed. You should have received an email");
  }

}

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
                Text(description),
                SmoothStarRating(
                rating: rating,
                size: 45,
                starCount: 5,
                onRatingChanged: (value) {
                  setState(() {
                    rating = value;
                  });
                )
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

} 