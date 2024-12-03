import 'dart:io';
import 'dart:math';

void main(){

  stdout.writeln("enter weight in pound");
  double weightInPound = double.parse(stdin.readLineSync()!);
  stdout.writeln("enter height in inches");
  double heightInInches = double.parse(stdin.readLineSync()!);
    
  stdout.writeln(double.parse("${(weightInPound*0.45359237)/pow(heightInInches*0.254, 2)}"));

}