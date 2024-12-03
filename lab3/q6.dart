/* WAP program to calculate the sum of all positive even numbers and the sum of all negative
odd numbers from a set of numbers. you can enter 0 (zero) to quit the program and thus it
displays the result. */

import 'dart:io';

void main() {
  // var list = [];
  bool check = true;
  // int totalSum = 0;
  int evenSum = 0;
  int oddSum = 0;
  while(true){
    stdout.writeln("enter 1 to add new number 0 to exit");
    int n = int.parse(stdin.readLineSync()!);

    switch(n){
      case 1:
        int val = int.parse(stdin.readLineSync()!);
        // list.add(val);
        if(val%2==0 && val>=0){
          evenSum+=val;
          print(evenSum);
        }
        if(val%2==1 && val<0){
          oddSum+=val;
          print(oddSum);
        }
      case 0:
        check=false;
        break;
    }
}
//     for(int i=0;i<list.length;i++){
//       int val = list[i];
//       if(val%2==0 && val>=0 || val%2==1 && val<0){
//               totalSum+=val;
//       }
//     }
//     print(totalSum);
  }

