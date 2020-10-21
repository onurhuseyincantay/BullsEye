import 'package:flutter/material.dart';

void main() => runApp(BullsEyeApp());

class BullsEyeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BullsEye",
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: GamePage(title: "BullsEye"),
    );
  }
}

class GamePage extends StatefulWidget {
  GamePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  bool _isAlertVisible = false;
  bool _isKnockKnockVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Hello World",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
            ),
            FlatButton(
              child: Text('Hit Me!', style: TextStyle(color: Colors.blue)),
              onPressed: () {
                this._isAlertVisible = true;
                _showAlert(context);
              },
            ),
            FlatButton(
              child: Text("Knock Knock!",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.amber)),
              onPressed: () {
                this._isKnockKnockVisible = true;
                _showKnockKnockAlert(context);
              },
            )
          ],
        ),
      ),
    );
  }

  void _showAlert(BuildContext context) {
    Widget okButton = FlatButton(
        child: Text("OK"),
        onPressed: () {
          Navigator.of(context).pop();
          this._isAlertVisible = false;
          print("Awesome pressed $_isAlertVisible");
        });
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Hello There!"),
          content: Text("This is my first pop-up."),
          actions: <Widget>[
            okButton,
          ],
          elevation: 5,
        );
      },
    );
  }

  void _showKnockKnockAlert(BuildContext context) {
    Widget knockKnockButton = FlatButton(
        child: Text("OK"),
        onPressed: () {
          Navigator.of(context).pop();
          this._isKnockKnockVisible = false;
        });
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Knock Knock!",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Text("Who is there?\nmaybe God, maybe Not"),
          actions: <Widget>[knockKnockButton],
          elevation: 5,
        );
      },
    );
  }
}
