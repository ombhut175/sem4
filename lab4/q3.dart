// WAP to generate Fibonacci series of N given number using method.

import 'dart:io';

void main(){
  fibboNaci(10);
}
void fibboNaci(int n){
  int first = 0;
  int second = 1;
  stdout.write("0 1 ");
  for(int i=2;i<=n;i++){
    int next = first+second;
    stdout.write("$next ");
    first = second;
    second = next;
  }
}