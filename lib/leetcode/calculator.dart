import 'package:flutter/material.dart';




class CalCulatorScreenCode extends StatefulWidget {
  @override
  _CalCulatorScreenCodeState createState() => _CalCulatorScreenCodeState();
}

class _CalCulatorScreenCodeState extends State<CalCulatorScreenCode> {
  String _input = '';
  String _output = '';

  void _addToInput(String value) {
    setState(() {
      _input += value;
    });
  }

  void _calculateResult() {
    try {
      final result = eval(_input);
      setState(() {
        _output = result.toString();
      });
    } catch (e) {
      setState(() {
        _output = 'Error';
      });
    }
  }

  void _clearInput() {
    setState(() {
      _input = '';
      _output = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              _input,
              style: TextStyle(fontSize: 24),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              _output,
              style: TextStyle(fontSize: 36),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildButton('7'),
              _buildButton('8'),
              _buildButton('9'),
              _buildButton('+'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildButton('4'),
              _buildButton('5'),
              _buildButton('6'),
              _buildButton('-'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildButton('1'),
              _buildButton('2'),
              _buildButton('3'),
              _buildButton('*'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildButton('0'),
              _buildButton('C', isClearButton: true),
              _buildButton('=', isEqualsButton: true),
              _buildButton('/', isOperatorButton: true),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton(
      String label, {
        bool isOperatorButton = false,
        bool isClearButton = false,
        bool isEqualsButton = false,
      }) {
    final color = isOperatorButton
        ? Colors.orange
        : isClearButton
        ? Colors.red
        : isEqualsButton
        ? Colors.green
        : Colors.grey;

    final onPressed = () {
      if (isOperatorButton) {
        _addToInput(' $label ');
      } else if (isClearButton) {
        _clearInput();
      } else if (isEqualsButton) {
        _calculateResult();
      } else {
        _addToInput(label);
      }
    };

    return Container(
      margin: EdgeInsets.all(4),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(primary: color),
      ),
    );
  }

  dynamic eval(String expression) {
    return new RegExp(r'\d+(\.\d+)?')
        .allMatches(expression)
        .map((match) => match.group(0))
        .map((str) => double.parse(str!))
        .toList()
        .reduce((a, b) => a + b);
  }
}
