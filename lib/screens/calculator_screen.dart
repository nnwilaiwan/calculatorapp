import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  int? firstNum;
  int? secondNum;
  String? history = '';
  String? textToDisplay = '';
  String? res;
  String? operation;

  void btnOnClick(String btnVal) {
    print(btnVal);

    if (btnVal == 'C') {
      textToDisplay = '';
      firstNum = 0;
      secondNum = 0;
      res = '';
    } else if (btnVal == 'AC') {
      textToDisplay = '';
      firstNum = 0;
      secondNum = 0;
      res = '';
      history = '';
    } else if (btnVal == '+/-') {
      if (textToDisplay![0] != '-') {
        res = '-' + textToDisplay!;
      } else {
        res = textToDisplay?.substring(1);
      }
    } else if (btnVal == '<') {
      res = textToDisplay?.substring(0,textToDisplay!.length - 1);
    } else if (btnVal == '+' ||
        btnVal == '-' ||
        btnVal == 'x' ||
        btnVal == '/') {
      firstNum = int.parse(textToDisplay!);
      res = '';
      operation = btnVal;
    } else if (btnVal == '=') {
      secondNum = int.parse(textToDisplay!);
      if (operation == '+') {
        res = (firstNum! + secondNum!).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == '-') {
        res = (firstNum! - secondNum!).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == 'x') {
        res = (firstNum! * secondNum!).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == '/') {
        res = (firstNum! / secondNum!).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
    } else {
      res = int.parse(textToDisplay! + btnVal).toString();
    }
    setState(() {
      textToDisplay = res;
    });
  }

  Widget calbutton(String btntxt, Color btncolor, Color txtcolor) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          btnOnClick(btntxt);
        },
        child: Text(
          btntxt,
          style: TextStyle(
            fontSize: 30,
            color: txtcolor,
          ),
        ),
        shape: const CircleBorder(),
        color: btncolor,
        padding: const EdgeInsets.all(20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Calculator'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  history!,
                  style: const TextStyle(
                    fontSize: 35,
                    color: Colors.grey,
                  ),
                ),
              ),
              alignment: const Alignment(1.0, 1.0),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  textToDisplay!,
                  style: const TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                  ),
                ),
              ),
              alignment: const Alignment(1.0, 1.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calbutton('AC', Colors.grey, Colors.black),
                calbutton('C', Colors.grey, Colors.black),
                calbutton('<', Colors.grey, Colors.black),
                calbutton('/', Colors.amber.shade700, Colors.white),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calbutton('7', Colors.grey.shade800, Colors.white),
                calbutton('8', Colors.grey.shade800, Colors.white),
                calbutton('9', Colors.grey.shade800, Colors.white),
                calbutton('x', Colors.amber.shade700, Colors.white),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calbutton('4', Colors.grey.shade800, Colors.white),
                calbutton('5', Colors.grey.shade800, Colors.white),
                calbutton('6', Colors.grey.shade800, Colors.white),
                calbutton('-', Colors.amber.shade700, Colors.white),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calbutton('1', Colors.grey.shade800, Colors.white),
                calbutton('2', Colors.grey.shade800, Colors.white),
                calbutton('3', Colors.grey.shade800, Colors.white),
                calbutton('+', Colors.amber.shade700, Colors.white),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calbutton('+/-', Colors.grey.shade800, Colors.white),
                calbutton('0', Colors.grey.shade800, Colors.white),
                calbutton('00', Colors.grey.shade800, Colors.white),
                calbutton('=', Colors.amber.shade700, Colors.white),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
