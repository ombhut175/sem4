// WAP to find the length of the last word in a given string, where a word is defined as a maximal
// substring consisting of non-space characters. Example: Input: s = "Hello World", Output: 5 (last
// word is "World"); Input: s = " fly me to the moon ", Output: 4 (last word is "moon").

import 'dart:io';

void main(){
  String s = stdin.readLineSync()!;
  List<String> list = s.split(" ");
  String lastOne = list[list.length-1];
  stdout.writeln(lastOne.length);
}