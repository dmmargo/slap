import 'package:flutter/material.dart';
import 'dart:math';

String element = "default";

class home_tab extends StatelessWidget {
  final Color color;

  Random rnd = new Random();
  home_tab(this.color);

  var flip = ["heads", "tails"];
  var roll = ['1', '2', '3', '4', '5', '6'];
  var shake = ['yes', 'no', 'maybe', 'not in your wildest dreams', 'of course', 'oh gosh', 'oh no', 'oh me oh my'];


  void flipcoin() {
    element = (flip..shuffle()).first;
    return print(element); // e.g. 'head'
  }
  void rolldice() {
    element = roll[rnd.nextInt(roll.length)];
    return print(element); // e.g. '2'
  }
  void shakeball() {
    element = shake[rnd.nextInt(shake.length)];
    return print(element);// e.g. 'yes'
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: color,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("Flip a coin (2)"),
              onPressed: flipcoin,
              color: Colors.black,
              textColor: Colors.yellow,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              splashColor: Colors.grey,
            ),
            SizedBox(height: 20),
            RaisedButton(
              child: Text("Roll a Dice (6)"),
              onPressed: rolldice,
              color: Colors.black,
              textColor: Colors.yellow,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              splashColor: Colors.grey,
            ),
            SizedBox(height: 20),
            RaisedButton(
              child: Text("Magic 8 Ball (8)"),
              onPressed: shakeball,
              color: Colors.black,
              textColor: Colors.yellow,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              splashColor: Colors.grey,
            ),
            SizedBox(height: 50),
            RaisedButton(
              child: Text("Get Results"),
              onPressed: () {
                return showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      // Retrieve the text the that user has entered by using the
                      // TextEditingController.
                        content: Text(element, style: TextStyle(fontWeight: FontWeight.bold),
                        ));
                  },
                );
              },
              color: Colors.pink,
              textColor: Colors.black,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              splashColor: Colors.grey,
            ),
          ],
        )));
  }

  String randomListItem(List<String> lst) {
    randomListItem(List lst) => lst[rnd.nextInt(lst.length)];

  }
}
