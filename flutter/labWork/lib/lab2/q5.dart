// WAP to find out largest number from given 3 numbers using conditional operator.

import 'dart:io';

void main(){
  stdout.writeln("enter number 1");
  int a = int.parse(stdin.readLineSync()!);
  stdout.writeln("enter number 2");
  int b = int.parse(stdin.readLineSync()!);
  stdout.writeln("enter number 3");
  int c = int.parse(stdin.readLineSync()!);
  a>b ? a>c ? stdout.writeln(a) : stdout.writeln(c) :  b>c ? stdout.writeln(b) : stdout.writeln(c);
}