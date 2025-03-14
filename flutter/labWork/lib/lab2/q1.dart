// WAP to check whether the given number is positive or negative.
import 'dart:io';

void main(){
  stdout.writeln("enter number");
  int n = int.parse(stdin.readLineSync()!);
  n<0 ? stdout.writeln("negative") : stdout.writeln("positive");
}
