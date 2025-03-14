// WAP to read 2 list and return list that contains only the elements that are common between
// them.

import 'dart:io';

void main(){
  List<int> l1 = [5,6,2,9,3];
  List<int> l2 = [5,4,3,9,2];
  Set<int> s1 = <int>{};
  List<int> ans = [];
  int n1 = l1.length;
  int n2 = l2.length;
  // int i=0;
  // int j=0;
  s1.addAll(l1);
  for(int j=0;j<l2.length;j++){
    if(s1.contains(l2[j])){
      ans.add(l2[j]);
    }
  }
  stdout.writeln(ans);
}