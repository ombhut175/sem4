// WAP to find the indices of two numbers in an integer array nums that add up to a given target.
// You may assume that each input has exactly one solution, and you cannot use the same
// element twice. The answer can be returned in any order. Example: Input: nums = [2, 7, 11,
// 15], target = 9, Output: [0, 1]; Input: nums = [3, 2, 4], target = 6, Output: [1, 2]; Input:
// nums = [3, 3], target = 6, Output: [0, 1].

import 'dart:io';

void main(){
  List<int> l1 = [3, 2, 4];
  int target = 6;
  List<int> ans = [];
  for(int i=0;i<l1.length;i++){
    for(int j=i+1;j<l1.length;j++){
      if(l1[i]+l1[j] == target){
        ans.add(i);
        ans.add(j);
      }
    }
  }
  stdout.writeln(ans);
}