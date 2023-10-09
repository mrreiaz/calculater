import 'package:calculater/buttons.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  final List<String> btns = [
    'AC',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    'X',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];

  bool isOparator(String x) {
    if (x == '%' ||
        x == '+' ||
        x == '-' ||
        x == 'X' ||
        x == '/' ||
        x == '=' ||
        x == 'ANS') {
      return true;
    }
    return false;
  }

  var userInput = '';
  var ans = '';

  elqalProcess() {
    String finalUrearInput = userInput;
    finalUrearInput = finalUrearInput.replaceAll('X', '*');
    Parser p = Parser();
    Expression exp = p.parse(finalUrearInput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    ans = eval.toString();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent[100],
      body: SafeArea(
        child: Column(
          children: [
            // show input and ans
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        userInput,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        ans,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // clculater btns
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.blueAccent[100],
                child: Center(
                  child: GridView.builder(
                      itemCount: btns.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4),
                      itemBuilder: (BuildContext context, int index) {
                        if (index == 0) {
                          return MyBtn(
                            color: Colors.greenAccent,
                            textColor: Colors.white,
                            btnText: btns[index],
                            btnTap: () {
                              setState(
                                () {
                                  userInput = '';
                                  ans = '';
                                },
                              );
                            },
                          );
                        } else if (index == 1) {
                          return MyBtn(
                            color: Colors.red,
                            textColor: Colors.white,
                            btnText: btns[index],
                            btnTap: () {
                              setState(() {
                                userInput = userInput.substring(
                                    0, userInput.length - 1);
                              });
                            },
                          );
                        } else if (index == btns.length - 1) {
                          return MyBtn(
                            color: Colors.red,
                            textColor: Colors.white,
                            btnText: btns[index],
                            btnTap: () {
                              setState(() {
                                elqalProcess();
                              });
                            },
                          );
                        } else {
                          return MyBtn(
                            // color: Colors.blueAccent,
                            color: isOparator(btns[index])
                                ? Colors.blueAccent
                                : Colors.black87,
                            textColor: Colors.white,
                            btnText: btns[index],
                            btnTap: () {
                              setState(
                                () {
                                  userInput += btns[index];
                                },
                              );
                            },
                          );
                        }
                      }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
