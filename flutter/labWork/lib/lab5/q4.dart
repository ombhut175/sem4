// WAP to create and read phonebook dictionary.

import 'dart:io';

void main(){
  Map<String,String> m1 = {
    "kishan":"32561452"
  };
  stdout.writeln("enter name");
  String name = stdin.readLineSync()!;
  m1.putIfAbsent("jay", ()=> "123456");
  // stdout.writeln(m1);
  stdout.writeln(m1[name]);
}