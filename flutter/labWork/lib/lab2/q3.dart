// WAP to find out largest number from given three numbers without using Logical Operator

import 'dart:io';

void main(){
  stdout.writeln("enter number 1");
  int a = int.parse(stdin.readLineSync()!);
  stdout.writeln("enter number 2");
  int b = int.parse(stdin.readLineSync()!);
  stdout.writeln("enter number 3");
  int c = int.parse(stdin.readLineSync()!);
  // a>b ? a>c ? stdout.writeln(a) : stdout.writeln(c) :  b>c ? stdout.writeln(b) : stdout.writeln(c);
  if(a>b){
    if(a>c) {
      stdout.writeln(a);
    }else{
      stdout.writeln(c);
    }
  }else{
    if(b>c){
      stdout.writeln(b);
    }else{
      stdout.writeln(c);
    }
  }
}