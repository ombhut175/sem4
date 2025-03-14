// WAP to find the majority element in a given array, where the majority element is the one that
// appears more than [n / 2] times. You may assume that the majority element always exists in
// the array. Example: Input: nums = [3, 2, 3], Output: 3; Input: nums = [2, 2, 1, 1, 1, 2, 2], Output:
// 2.

import 'dart:collection';
import 'dart:io';

void main(){
  List<int> nums = [3, 2, 3];
  int n = nums.length;
  HashMap<int,int> h1 = HashMap<int,int>();
  for(int i=0;i<n;i++){
    if(h1.containsKey(nums[i])){
      h1[nums[i]] = h1[nums[i]]! + 1;
    }else{
      h1[nums[i]] = 1;
    }
  }
  // stdout.writeln(h1);
  h1.forEach((key,value){
    // stdout.writeln("key = $key value = $value");
    if(value>=n/2){
      stdout.write("$key ");
    }
  });
}