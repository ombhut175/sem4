//sum of two numbers

import 'dart:io';

void main(){
  stdout.writeln("enter num 1");
  int a = int.parse(stdin.readLineSync()!);
  stdout.writeln("enter num 2");
  int b = int.parse(stdin.readLineSync()!);
  stdout.writeln(a+b);
}