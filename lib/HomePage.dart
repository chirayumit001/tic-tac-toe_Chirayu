import 'package:flutter/material.dart';
import 'UserName.dart';

import 'AI.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 200),
              child: Column(children: <Widget>[
                Text("TIC TAC TOE"),
                SizedBox(height: 30),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        textColor: Colors.black,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AIPage()),
                          );
                        },
                        child: Text("Play With AI"),
                      ),
                      SizedBox(width: 30),
                      RaisedButton(
                        textColor: Colors.black,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserNamePage()),
                          );
                        },
                        child: Text("Play With Human"),
                      ),
                    ]),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
