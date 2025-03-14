/* WAP to perform Addition, Subtraction, Multiplication, Division based on user choice using if,
if..else..if, & switch */

import 'dart:io';

void main(){
  stdout.writeln("enter number 1");
  int a = int.parse(stdin.readLineSync()!);
  stdout.writeln("enter operator");
  String operator = stdin.readLineSync()!;
  stdout.writeln("enter number 2");
  int b = int.parse(stdin.readLineSync()!);
  if(operator[0]=='+') {
    stdout.writeln(a + b);
  } else if(operator[0]=='-') {
    stdout.writeln(a - b);
  }else if(operator[0]=='*') {
    stdout.writeln(a * b);
  }else if(operator[0]=='/') {
    stdout.writeln(a / b);
  }
}