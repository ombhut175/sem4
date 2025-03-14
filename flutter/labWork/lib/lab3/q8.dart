// WAP to count the occurrences of each word in a given sentence. Return a map where the keys
// are the words, and the values are the number of occurrences of each word. Example: Input:
// "this is a test this is a", Output: {'this': 2, 'is': 2, 'a': 2, 'test': 1}.

import 'dart:io';

void main(){
  String s = "this is a test this is a";
  List<String> l1 = s.split(" ");
  Map<String,int> m1 = Map<String,int>();
  for(int i=0;i<l1.length;i++){
    if(m1[l1[i]]==null) {
      m1.putIfAbsent(l1[i], ()=>1);
    }else{
      m1[l1[i]] = m1[l1[i]]! + 1;
    }
  }
  stdout.writeln(m1);
}