import 'dart:io';

void main(){
  // print("hello world");
  stdout.writeln("enter integer");
  int a = int.parse(stdin.readLineSync()!);
  stdout.writeln(a);
  stdout.writeln("enter double");
  double b = double.parse(stdin.readLineSync()!);
  stdout.writeln(b);
  stdout.writeln("enter string");
  String s = stdin.readLineSync()!;
  stdout.writeln(s);
}