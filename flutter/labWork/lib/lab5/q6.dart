// WAP to accept n numbers in an array. Display the sum of all the numbers which are divisible
// by either 3 or 5.

import 'dart:io';

void main(){
  List<int> l1  = [3,15,20,5,17];
  int sum = 0;
  for(int i=0;i<l1.length;i++){
    if(l1[i]%3==0 || l1[i]%5==0){
      sum+=l1[i];
    }
  }
  stdout.writeln(sum);
}