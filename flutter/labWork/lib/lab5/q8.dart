// WAP to find the largest odd integer (as a string) that is a non-empty substring of a given string
// num, which represents a large integer. If no odd integer exists, return an empty string "".
// Example: Input: num = "52", Output: "5"; Input: num = "4206", Output: ""; Input: num =
// "35427", Output: "35427".

import 'dart:io';

void main(){
  // List<int> l1 = [3, 2, 4];
  String s = "52";
  for(int i=s.length-1;i>=0;i--){
    if(int.parse(s[i])%2!=0){
      stdout.writeln(s.substring(0,i+1));
      break;
    }
  }
}