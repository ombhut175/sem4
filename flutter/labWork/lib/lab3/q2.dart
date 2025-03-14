// WAP to find factorial of the given number

import 'dart:io';

void main(){
  stdout.writeln("enter number 1");
  int a = int.parse(stdin.readLineSync()!);
  int ans = 1;
  for(int i=2;i<=a;i++){
    ans*=i;
  }
  print(ans);
}