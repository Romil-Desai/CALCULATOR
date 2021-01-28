import 'package:calculator/CalculatorUI.dart';
import 'package:calculator/RoundedButton.dart';
import 'package:calculator/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// log first = log(operation.toString(), result.toString());
// int currentlog=0;
bool islightMode = true;
bool isDarkMode = false;
String operation = "";
String result = "";
List<String> operatorlist = ["+", "-", "/", "%", "*"];

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Color backgroundColor;
  Color numberFontColor;
  Color operatorFontColor;
  Color commandsFontColor;
  Color operatorButtonColor;
  Color commandsButtonColor;
  Color containerColor;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // listofoperations.add(newoperation(first));
  }

  @override
  Widget build(BuildContext context) {
    // listofoperations.elementAt(index)
    backgroundColor =
        islightMode ? Colors.white : Color.fromRGBO(40, 54, 55, 1);
    numberFontColor = Colors.grey;
    operatorFontColor = Color.fromRGBO(3, 149, 136, 1);
    commandsFontColor = islightMode ? Colors.grey : Colors.white;
    operatorButtonColor = Colors.white;
    commandsButtonColor = islightMode ? Colors.white : Colors.grey;
    containerColor = islightMode
        ? Color.fromRGBO(3, 149, 136, 1)
        : Color.fromRGBO(40, 54, 55, 1);
    Color operationscolors = islightMode ? Colors.black : Colors.white;
    // listofoperations.add(newoperation(first));
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          children: [
            Container(
              height: 60.0,
              color: containerColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      'CALCULATOR',
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      setState(() {
                        if (islightMode) {
                          islightMode = false;
                        } else {
                          islightMode = true;
                        }
                      });
                    },
                    child: Icon(
                      islightMode ? Icons.nightlight_round : Icons.wb_sunny,
                      color: Colors.white,
                      size: 30.0,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  verticalDirection: VerticalDirection.down,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                        child: Padding(
                      padding: EdgeInsets.only(right: 35.0, bottom: 15.0),
                      child: SingleChildScrollView(
                        child: Container(
                          child: Column(
                            verticalDirection: VerticalDirection.down,
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                operation,
                                style: TextStyle(
                                    fontSize: 50.0, color: operationscolors),
                              ),
                              Text(
                                result,
                                style: TextStyle(
                                    fontSize: 25.0, color: operationscolors),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundedButton(() {
                            setState(() {
                              operation = "";
                              result = "";
                            });
                          },
                              Text(
                                'AC',
                                style: buttonTextStyle.copyWith(
                                  color: commandsFontColor,
                                ),
                              ),
                              commandsButtonColor),
                          RoundedButton(() {
                            setState(() {
                              if (operation != "") {
                                operation = operation.substring(
                                    0, operation.length - 1);
                              }
                            });
                          },
                              Text(
                                'C',
                                style: buttonTextStyle.copyWith(
                                    color: commandsFontColor),
                              ),
                              commandsButtonColor),
                          RoundedButton(() {
                            setState(() {
                              if (operation[operation.length - 1] != "." &&
                                  operation != "" &&
                                  !operatorlist.contains(
                                      operation[operation.length - 1])) {
                                operation += '%';
                              }
                            });
                          },
                              Text(
                                '%',
                                style: buttonTextStyle.copyWith(
                                  color: operatorFontColor,
                                ),
                              ),
                              operatorButtonColor),
                          RoundedButton(() {
                            setState(() {
                              if (operation[operation.length - 1] != "." &&
                                  operation != "" &&
                                  !operatorlist.contains(
                                      operation[operation.length - 1])) {
                                operation += '/';
                              }
                            });
                          },
                              Text(
                                '/',
                                style: buttonTextStyle.copyWith(
                                    color: operatorFontColor),
                              ),
                              operatorButtonColor),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundedButton(() {
                            setState(() {
                              operation += '7';
                            });
                          },
                              Text(
                                '7',
                                style: buttonTextStyle.copyWith(
                                  color: numberFontColor,
                                ),
                              ),
                              backgroundColor),
                          RoundedButton(() {
                            setState(() {
                              operation += '8';
                            });
                          },
                              Text(
                                '8',
                                style: buttonTextStyle.copyWith(
                                  color: numberFontColor,
                                ),
                              ),
                              backgroundColor),
                          RoundedButton(() {
                            setState(() {
                              operation += '9';
                            });
                          },
                              Text(
                                '9',
                                style: buttonTextStyle.copyWith(
                                  color: numberFontColor,
                                ),
                              ),
                              backgroundColor),
                          RoundedButton(() {
                            setState(() {
                              if (operation[operation.length - 1] != "." &&
                                  operation != "" &&
                                  !operatorlist.contains(
                                      operation[operation.length - 1])) {
                                operation += '*';
                              }
                            });
                          },
                              Text(
                                'X',
                                style: buttonTextStyle.copyWith(
                                  color: operatorFontColor,
                                ),
                              ),
                              operatorButtonColor),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundedButton(() {
                            setState(() {
                              operation += '4';
                            });
                          },
                              Text(
                                '4',
                                style: buttonTextStyle.copyWith(
                                  color: numberFontColor,
                                ),
                              ),
                              backgroundColor),
                          RoundedButton(() {
                            setState(() {
                              operation += '5';
                            });
                          },
                              Text(
                                '5',
                                style: buttonTextStyle.copyWith(
                                  color: numberFontColor,
                                ),
                              ),
                              backgroundColor),
                          RoundedButton(() {
                            setState(() {
                              operation += '6';
                            });
                          },
                              Text(
                                '6',
                                style: buttonTextStyle.copyWith(
                                  color: numberFontColor,
                                ),
                              ),
                              backgroundColor),
                          RoundedButton(() {
                            setState(() {
                              if (operation == "" ||
                                  (!operatorlist.contains(
                                          operation[operation.length - 1]) &&
                                      operation[operation.length - 1] != ".")) {
                                operation += '-';
                              }
                            });
                          },
                              Text(
                                '-',
                                style: buttonTextStyle.copyWith(
                                  color: operatorFontColor,
                                ),
                              ),
                              operatorButtonColor),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundedButton(() {
                            setState(() {
                              operation += '1';
                            });
                          },
                              Text(
                                '1',
                                style: buttonTextStyle.copyWith(
                                  color: numberFontColor,
                                ),
                              ),
                              backgroundColor),
                          RoundedButton(() {
                            setState(() {
                              operation += '2';
                            });
                          },
                              Text(
                                '2',
                                style: buttonTextStyle.copyWith(
                                  color: numberFontColor,
                                ),
                              ),
                              backgroundColor),
                          RoundedButton(() {
                            setState(() {
                              operation += '3';
                            });
                          },
                              Text(
                                '3',
                                style: buttonTextStyle.copyWith(
                                  color: numberFontColor,
                                ),
                              ),
                              backgroundColor),
                          RoundedButton(() {
                            setState(() {
                              if (operation == "" ||
                                  (!operatorlist.contains(
                                          operation[operation.length - 1]) &&
                                      operation[operation.length - 1] != ".")) {
                                operation += '+';
                              }
                            });
                          },
                              Text(
                                '+',
                                style: buttonTextStyle.copyWith(
                                  color: operatorFontColor,
                                ),
                              ),
                              operatorButtonColor),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundedButton(() {
                            setState(() {
                              if (operation == "" ||
                                  !operatorlist.contains(
                                      operation[operation.length - 1])) {
                                operation += '-';
                              }
                            });
                          },
                              Text(
                                'N',
                                style: buttonTextStyle.copyWith(
                                  color: numberFontColor,
                                ),
                              ),
                              backgroundColor),
                          RoundedButton(() {
                            setState(() {
                              operation += '0';
                            });
                          },
                              Text(
                                '0',
                                style: buttonTextStyle.copyWith(
                                  color: numberFontColor,
                                ),
                              ),
                              backgroundColor),
                          RoundedButton(() {
                            setState(() {
                              operation += '.';
                            });
                          },
                              Text(
                                '.',
                                style: buttonTextStyle.copyWith(
                                  color: numberFontColor,
                                ),
                              ),
                              backgroundColor),
                          RoundedButton(() {
                            setState(() {
                              if (operation != "." &&
                                  operation != null &&
                                  !operatorlist.contains(
                                      operation[operation.length - 1]))
                                result =
                                    getresult(newcalculateResult(operation));
                            });
                          },
                              Text(
                                '=',
                                style: buttonTextStyle.copyWith(
                                  color: operatorFontColor,
                                ),
                              ),
                              operatorButtonColor),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
