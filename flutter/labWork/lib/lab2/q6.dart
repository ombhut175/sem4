import 'dart:io';

void main() {
  String s = "22 + 15 * 23";
  var list = s.split(" ");

  // Handling parentheses first
  while (list.contains('(')) {
    int start = list.lastIndexOf('(');
    int end = list.indexOf(')', start);
    List<String> subList = list.sublist(start + 1, end);

    // Handle operations inside the parentheses
    handleOperations(subList, ['*', '/']);
    handleOperations(subList, ['+', '-']);

    // Replace the parentheses with the calculated result
    list.replaceRange(start, end + 1, [subList[0]]);
  }

  // Handling multiplication and division before addition and subtraction
  handleOperations(list, ['*', '/']);
  handleOperations(list, ['+', '-']);

  stdout.writeln('Result: ${list[0]}');
}

void handleOperations(List<String> list, List<String> operations) {
  int i = 0;
  while (i < list.length) {
    if (operations.contains(list[i])) {
      performCalculation(list, i);
      i = -1; // Restart loop to handle new tokens
    }
    i++;
  }
}

void performCalculation(List<String> list, int i) {
  double ans = performOperation(list[i], list[i - 1], list[i + 1]);
  list.removeRange(i - 1, i + 2);
  list.insert(i - 1, ans.toString());
}

double performOperation(String operation, String left, String right) {
  double leftVal = double.parse(left);
  double rightVal = double.parse(right);

  switch (operation) {
    case '+':
      return leftVal + rightVal;
    case '-':
      return leftVal - rightVal;
    case '*':
      return leftVal * rightVal;
    case '/':
      if (rightVal != 0) {
        return leftVal / rightVal;
      } else {
        throw ArgumentError("Division by zero is not allowed.");
      }
    default:
      throw ArgumentError("Unsupported operation: $operation");
  }
}

bool canBeConvertedToNumber(String character) {
  return double.tryParse(character) != null;
}
