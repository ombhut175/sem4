// WAP to sort an array of names based on the corresponding heights in descending order. The
// names and heights are given as two separate arrays, and the heights are distinct positive
// integers. Example: Input: names = ["Mary","John","Emma"], heights = [180,165,170], Output:
// ["Mary","Emma","John"]; Input: names = ["Alice","Bob","Bob"], heights = [155,185,150],
// Output: ["Bob","Alice","Bob"].

import 'dart:collection';
import 'dart:io';

class Person{
  String name;
  int height;
  Person(this.name, this.height);
}


void main(){
  List<String> names = ["Alice","Bob","Bob"];
  List<int> height = [155,185,150];
  List<Person> p1 = [];
  for(int i=0;i<names.length;i++){
    p1.add(new Person(names[i], height[i]));
  }
  List<Person> sorted = p1..sort((e1,e2)=> e2.height - e1.height);
  sorted.forEach((val)=> stdout.write("${val.name} "));
}