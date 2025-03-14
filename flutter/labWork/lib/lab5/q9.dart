// WAP to remove duplicates from a list of integers. Return a new list that contains only the
// unique elements, with duplicates removed, using a map. Example: Input: nums = [1, 2, 2, 3,
// 4, 4], Output: [1, 2, 3, 4].

import 'dart:collection';
import 'dart:io';

void main(){
  List<int> l1 = [1,1, 2, 2, 3,4,4,4,4,7,7,7,3];
  Map<int,int> m1 = <int,int>{};
  for(int i=0;i<l1.length;i++){
    if(m1.containsKey(l1[i])){
      l1.removeAt(i);
      i--;
    }else{
      m1[l1[i]] = i;
    }
  }
  stdout.writeln(l1);
}