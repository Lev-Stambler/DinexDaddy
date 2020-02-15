import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';


class Feedback extends StatefulWidget {
  _Feedback createState() => _Feedback();
}

class _Feedback extends State<Feedback> {
  var rating = 0.0;
  confirm(BuildContext context, String title, String description) {
    return showDialog (
      context: context,
      //barrierDismissable: true,
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Feedback"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SmoothStarRating(
                  allowHalfRating: false,
                  onRatingChanged: (v) {
                    rating = v;
                    setState(() {});
                  },
                  starCount: 5,
                  rating: rating,
                  size: 40.0,
                  filledIconData: Icons.blur_off,
                  halfFilledIconData: Icons.blur_on,
                  color: Colors.green,
                  borderColor: Colors.green,
                  spacing:0.0
                ),
                TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Let us know about your experience'
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/buy-or-sell');
                  },
                  child: Text('Home'),
                )
              ],
            ),
          ),
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