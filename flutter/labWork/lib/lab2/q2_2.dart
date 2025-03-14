import 'dart:io';

void main(){
  stdout.writeln("enter number 1");
  int a = int.parse(stdin.readLineSync()!);
  stdout.writeln("enter operator");
  String operator = stdin.readLineSync()!;
  stdout.writeln("enter number 2");
  int b = int.parse(stdin.readLineSync()!);
  switch(operator[0]){
    case '+' : stdout.writeln(a + b);
    case '-' : stdout.writeln(a - b);
    case '*' : stdout.writeln(a * b);
    case '/' : stdout.writeln(a / b);
    default: break;
  }
}
