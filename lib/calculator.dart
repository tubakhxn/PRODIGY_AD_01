import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _output = "0";
  String _result = "0";
  String _operation = "";
  double num1 = 0;
  double num2 = 0;

  buttonPressed(String buttonText) {
    if (buttonText == "C") {
      _output = "0";
      _result = "0";
      _operation = "";
      num1 = 0;
      num2 = 0;
    } else if (buttonText == "+" || buttonText == "-" || buttonText == "*" || buttonText == "/") {
      num1 = double.parse(_result);
      _operation = buttonText;
      _output = "0";
    } else if (buttonText == ".") {
      if (!_output.contains(".")) {
        _output += buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(_output);

      switch (_operation) {
        case "+":
          _result = (num1 + num2).toString();
          break;
        case "-":
          _result = (num1 - num2).toString();
          break;
        case "*":
          _result = (num1 * num2).toString();
          break;
        case "/":
          _result = (num1 / num2).toString();
          break;
        default:
          break;
      }

      _output = _result;
      _operation = "";
    } else {
      if (_output == "0") {
        _output = buttonText;
      } else {
        _output += buttonText;
      }
      _result = _output;
    }

    setState(() {});
  }

  Widget buildButton(String buttonText, Color color, {Color textColor = Colors.white}) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(20.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            primary: color,
          ),
          onPressed: () => buttonPressed(buttonText),
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 24.0, color: textColor),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkTheme ? Colors.black : Colors.white,
      appBar: AppBar(
        title: Text('Calculator',
        style: TextStyle(fontSize: 25),),
        backgroundColor: isDarkTheme ? Colors.black : Colors.blue,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 150,),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
            child: Text(
              _result,
              style: TextStyle(
                fontSize: 48.0,
                color: isDarkTheme ? Colors.white : Colors.black,
              ),
            ),
          ),
          Expanded(
            child: Divider(color: Colors.transparent),
          ),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  buildButton("7", isDarkTheme ? Colors.grey[850]! : Colors.grey[300]!, textColor: isDarkTheme ? Colors.white : Colors.black),
                  buildButton("8", isDarkTheme ? Colors.grey[850]! : Colors.grey[300]!, textColor: isDarkTheme ? Colors.white : Colors.black),
                  buildButton("9", isDarkTheme ? Colors.grey[850]! : Colors.grey[300]!, textColor: isDarkTheme ? Colors.white : Colors.black),
                  buildButton("/", Colors.blue, textColor: Colors.white),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton("4", isDarkTheme ? Colors.grey[850]! : Colors.grey[300]!, textColor: isDarkTheme ? Colors.white : Colors.black),
                  buildButton("5", isDarkTheme ? Colors.grey[850]! : Colors.grey[300]!, textColor: isDarkTheme ? Colors.white : Colors.black),
                  buildButton("6", isDarkTheme ? Colors.grey[850]! : Colors.grey[300]!, textColor: isDarkTheme ? Colors.white : Colors.black),
                  buildButton("*", Colors.blue, textColor: Colors.white),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton("1", isDarkTheme ? Colors.grey[850]! : Colors.grey[300]!, textColor: isDarkTheme ? Colors.white : Colors.black),
                  buildButton("2", isDarkTheme ? Colors.grey[850]! : Colors.grey[300]!, textColor: isDarkTheme ? Colors.white : Colors.black),
                  buildButton("3", isDarkTheme ? Colors.grey[850]! : Colors.grey[300]!, textColor: isDarkTheme ? Colors.white : Colors.black),
                  buildButton("-", Colors.blue, textColor: Colors.white),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton(".", isDarkTheme ? Colors.grey[850]! : Colors.grey[300]!, textColor: isDarkTheme ? Colors.white : Colors.black),
                  buildButton("0", isDarkTheme ? Colors.grey[850]! : Colors.grey[300]!, textColor: isDarkTheme ? Colors.white : Colors.black),
                  buildButton("C", isDarkTheme ? Colors.grey[850]! : Colors.grey[300]!, textColor: isDarkTheme ? Colors.white : Colors.black),
                  buildButton("+", Colors.blue, textColor: Colors.white),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton("=", Colors.blue, textColor: Colors.white),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
