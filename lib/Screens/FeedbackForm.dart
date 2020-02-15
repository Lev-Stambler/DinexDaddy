import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';


class FeedbackForm extends StatefulWidget {
  _FeedbackForm createState() => _FeedbackForm();
}

class _FeedbackForm extends State<FeedbackForm> {
  var rating = 0.0;

  @override
  Widget build(BuildContext context) {
    Color PrimaryColor = const Color(0xFFB71C1C);
    return Scaffold(
          appBar: AppBar(
            title: Text("Feedback"),
            backgroundColor: PrimaryColor,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 180,
                  width: 180,
                  child: Image.asset('lib/images/logo.png'),
                  padding: EdgeInsets.only(bottom: 50),
                  ),  
                SmoothStarRating(
                  allowHalfRating: true,
                  onRatingChanged: (v) {
                    rating = v;
                    setState(() {});
                  },
                  starCount: 5,
                  rating: rating,
                  size: 40.0,
                  color: Colors.red,
                  borderColor: Colors.red,
                  spacing:0.0
                ),
                new Container(
                width: 300.0,
                margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                child:
                  new TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Let us know about your experience'
                    ),
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Home'),
                )
              ],
            ),
          ),
        );
  }

} 