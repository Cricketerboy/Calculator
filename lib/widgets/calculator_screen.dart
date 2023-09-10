import 'package:flutter/material.dart';
import 'package:calculator/widgets/calculator_button.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var firstnum;
  var secondnum;
  var history = "";
  var texttodisplay = "";
  var res;
  var operation;

  void btnOnClick(String btnVal) {
    if (btnVal == 'C') {
      firstnum = 0;
      texttodisplay = "";
      res = "";
      secondnum = 0;
    } else if (btnVal == 'AC') {
      firstnum = 0;
      texttodisplay = "";
      res = "";
      secondnum = 0;
      history = "";
    } else if (btnVal == '+/-') {
      if (texttodisplay[0] != '-') {
        res = '-' + texttodisplay;
      } else {
        res = texttodisplay.substring(1);
      }
    } else if (btnVal == '<') {
      res = texttodisplay.substring(0, texttodisplay.length - 1);
    } else if (btnVal == '+' ||
        btnVal == '-' ||
        btnVal == 'X' ||
        btnVal == '/') {
      firstnum = int.parse(texttodisplay);
      res = "";
      operation = btnVal;
    } else if (btnVal == '=') {
      secondnum = int.parse(texttodisplay);
      if (operation == '+') {
        res = (firstnum + secondnum).toString();
        history =
            firstnum.toString() + operation.toString() + secondnum.toString();
      } else if (operation == '-') {
        res = (firstnum - secondnum).toString();
        history =
            firstnum.toString() + operation.toString() + secondnum.toString();
      } else if (operation == 'X') {
        res = (firstnum * secondnum).toString();
        history =
            firstnum.toString() + operation.toString() + secondnum.toString();
      } else if (operation == '/') {
        res = (firstnum / secondnum).toString();
        history =
            firstnum.toString() + operation.toString() + secondnum.toString();
      }
    } else {
      res = int.parse(texttodisplay + btnVal).toString();
    }
    setState(() {
      texttodisplay = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Calculator'),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      backgroundColor: Color(0xFF28527a),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(right: 12.0),
              child: Text(
                history,
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.lightBlueAccent,
                ),
              ),
              alignment: Alignment(1.0, 1.0),
            ),
            Container(
              padding: EdgeInsets.all(12.0),
              child: Text(
                texttodisplay,
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                ),
              ),
              alignment: Alignment(1.0, 1.0),
            ),
            Divider(color: Colors.white),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Button(text: 'AC', tbgcolor: Colors.lightBlue, tsize: 13.0),
                Button(text: 'C', tbgcolor: Colors.lightBlue),
                Button(text: '<', tbgcolor: Colors.yellow),
                Button(text: '/', tbgcolor: Colors.yellow),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Button(text: '9', tbgcolor: Colors.lightBlue),
                Button(text: '8', tbgcolor: Colors.lightBlue),
                Button(text: '7', tbgcolor: Colors.lightBlue),
                Button(text: 'X', tbgcolor: Colors.yellow),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Button(text: '6', tbgcolor: Colors.lightBlue),
                Button(text: '5', tbgcolor: Colors.lightBlue),
                Button(text: '4', tbgcolor: Colors.lightBlue),
                Button(text: '-', tbgcolor: Colors.yellow),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Button(text: '3', tbgcolor: Colors.lightBlue),
                Button(text: '2', tbgcolor: Colors.lightBlue),
                Button(text: '1', tbgcolor: Colors.lightBlue),
                Button(text: '+', tbgcolor: Colors.yellow),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Button(text: '+/-', tbgcolor: Colors.lightBlue, tsize: 13.0),
                Button(text: '0', tbgcolor: Colors.lightBlue),
                Button(text: '00', tbgcolor: Colors.lightBlue, tsize: 13.0),
                Button(text: '=', tbgcolor: Colors.yellow),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget Button({
    text,
    tcolor: Colors.black,
    tbgcolor: Colors.lightBlue,
    tsize: 20.0,
  }) {
    return Container(
      margin: EdgeInsets.all(10.0),
      height: 50,
      width: 60,
      child: ElevatedButton(
        onPressed: () => btnOnClick(text),
        child: Text(
          text,
          style: TextStyle(
            fontSize: tsize,
            color: tcolor,
          ),
        ),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          primary: tbgcolor,
        ),
      ),
    );
  }
}
