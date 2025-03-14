// WAP to calculate the angle between the hour and minute hands of a clock, where the hours
// and minutes are taken from the user. Example: Input: hours = 3, minutes = 15, Output: 7.5
// (angle between the hands is 7.5 degrees).

import 'dart:io';

void main(){
  int hour = int.parse(stdin.readLineSync()!);
  int minute = int.parse(stdin.readLineSync()!);
  double angle = (30*hour)-(11/2*minute);
  stdout.writeln(angle);
}