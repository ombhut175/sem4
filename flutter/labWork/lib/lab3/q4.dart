// WAP to print given number in reverse order.
import 'dart:io';

void main(){
    stdout.writeln("enter number");
    int n = int.parse(stdin.readLineSync()!);
    while(n>0){
      stdout.write(n%10);
      n ~/= 10;
  }
}