import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/services.dart';

int rngnum = 1;
TextEditingController numberController = new TextEditingController();

main() {
  int variable = int.parse(numberController.text);

  print(numberController);
  Random random = new Random();
  rngnum = random.nextInt((variable) + 1);
  print(rngnum);
}

class rng_tab extends StatelessWidget {
  final Color color;
  rng_tab(this.color);

  //rngnum = int.parse(numberController);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: color,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'please enter a max number:',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 50),
            TextFormField(
              autofocus: true,
              controller: numberController,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                WhitelistingTextInputFormatter.digitsOnly,
              ],
              decoration: new InputDecoration(
                labelText: "Enter your number",
                hoverColor: Colors.blueGrey,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(4.0),
                  ),
                ),
              ),
              cursorColor: Colors.blue,
              obscureText: false,
            ),
            SizedBox(height: 40),
            RaisedButton(
              child: Text("Get Results", style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),),
              onPressed: () {
                main();
                return showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                        // Retrieve the text the that user has entered by using the
                        // TextEditingController.
                        content: Text(
                      (rngnum.toString()),
                      style: TextStyle(fontWeight: FontWeight.bold),
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
}
