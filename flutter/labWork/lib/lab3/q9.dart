// WAP to insert an element at a specific position in an array. The program should modify the
// existing array without creating a new one. Example: Input: array = [1, 2, 4, 5], element = 3,
// position = 2, Output: [1, 2, 3, 4, 5]; Input: array = [10, 20, 30], element = 25, position = 1,
// Output: [10, 25, 20, 30].

import 'dart:io';

void main(){
  List<int> arr = [10, 20, 30];
  insertElement(arr, 25,1);
  stdout.writeln(arr);
}

void insertElement(List<int> arr,int val,int position){
  arr.insert(position, val);
}