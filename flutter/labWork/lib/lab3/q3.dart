// WAP to find whether the given number is prime or not

import 'dart:io';

void main(){
  stdout.writeln("enter number 1");
  int a = int.parse(stdin.readLineSync()!);
  bool check = true;
  for(int i=2;i<a/2;i++){
    if(a%i==0){
      check = false;
      break;
    }
  }
  check ? stdout.writeln('prime') : stdout.writeln('not prime');
}