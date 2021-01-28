String calculateResult(String operation) {
  int i = 0;
  double result = 0;
  double operand1 = 0;
  double operand2 = 0;
  String operand;
  String temp1 = "";
  String temp2 = "";

  while (i < operation.length) {
    while (i < operation.length &&
        (_isNumeric(operation[i]) || operation[i] == '.')) {
      temp1 = '$temp1${operation[i]}';
      i = i + 1;
    }
    if (temp1 != "") {
      operand1 = double.tryParse(temp1);
    }
    operand = operation[i];
    i += 1;
    while (i <= operation.length - 1 &&
        (_isNumeric(operation[i]) || operation[i] == '.')) {
      temp2 = '$temp2${operation[i]}';
      i = i + 1;
    }
    if (temp2 != "") {
      operand2 = double.tryParse(temp2);
    }

    result = getarithmeticresult(operand1, operand2, operand);
    operand1 = result;
    operand2 = 0;
    temp1 = "";
    temp2 = "";
  }
  return result.toString();
}

void main() {
  List result = newcalculateResult('-56-35/7+3%8');
  print(result);
  print(getresult(result));
}

bool _isNumeric(String result) {
  if (result == null) {
    return false;
  }
  return double.tryParse(result) != null;
}

List newcalculateResult(String operation) {
  int i = 0;
  List<dynamic> operationlist = [];
  String temp1 = "";
  String temp2 = "";

  while (i < operation.length) {
    while (i < operation.length &&
        (_isNumeric(operation[i]) || operation[i] == '.')) {
      temp1 = '$temp1${operation[i]}';
      i = i + 1;
    }
    if (temp1 != "") {
      operationlist.add(double.tryParse(temp1));
    }
    operationlist.add(operation[i]);
    i += 1;
    while (i <= operation.length - 1 &&
        (_isNumeric(operation[i]) || operation[i] == '.')) {
      temp2 = '$temp2${operation[i]}';
      i = i + 1;
    }
    if (temp2 != "") {
      operationlist.add(double.tryParse(temp2));
    } else {
      operationlist.add(0);
    }
    temp1 = "";
    temp2 = "";
  }
  return operationlist;
}

String getresult(List operationlist) {
  int i = 0;
  String operand;
  double operand1 = 0;
  double operand2 = 0;
  while (i < operationlist.length) {
    if (operationlist[i] == "*" ||
        operationlist[i] == "/" ||
        operationlist[i] == "%") {
      int resultindex = i - 2;
      print(resultindex);
      operand =
          operationlist[i] == "*" ? "*" : (operationlist[i] == "/" ? "/" : "%");
      operand1 = operationlist[i - 1];
      operand2 = operationlist[i + 1];
      operationlist.removeAt(i + 1);
      operationlist.removeAt(i);
      operationlist.removeAt(i - 1);
      operationlist.insert(
          resultindex + 1, getarithmeticresult(operand1, operand2, operand));
      i = resultindex + 1;
      i += 1;
    } else {
      i += 1;
    }
  }
  i = 0;
  while (i < operationlist.length) {
    if (operationlist[i] == "+" || operationlist[i] == "-") {
      if (i - 1 < 0) {
        int resultindex = i - 1;
        operand = operationlist[i] == "-" ? "-" : "+";
        operand1 = 0;
        operand2 = operationlist[i + 1];
        operationlist.removeAt(i + 1);
        operationlist.removeAt(i);
        operationlist.insert(
            resultindex + 1, getarithmeticresult(operand1, operand2, operand));
        i = resultindex + 1;
        i += 1;
      } else {
        int resultindex = i - 2;
        print(resultindex);
        operand = operationlist[i] == "-" ? "-" : "+";
        operand1 = operationlist[i - 1];
        operand2 = operationlist[i + 1];
        operationlist.removeAt(i + 1);
        operationlist.removeAt(i);
        operationlist.removeAt(i - 1);
        operationlist.insert(
            resultindex + 1, getarithmeticresult(operand1, operand2, operand));
        i = resultindex + 1;
        i += 1;
      }
    } else {
      i += 1;
    }
  }
  return operationlist[0].toString();
}

double getarithmeticresult(double operand1, double operand2, String operand) {
  switch (operand) {
    case '+':
      return operand1 + operand2;
    case '-':
      return operand1 - operand2;
    case '*':
      return operand1 * operand2;
    case '/':
      return operand1 / operand2;
    case '%':
      return operand1 % operand2;
  }
}
