// WAP that creates List with following value:“Delhi”, “Mumbai”, “Bangalore”, “Hyderabad” and
// “Ahmedabad” Replace “Ahmedabad” with “Surat” in above List.

import 'dart:io';

void main(){
  List<String> l1 = ["delhi","mumbai","Bangalore","Hyderabad","Ahmedabad"];
  int index =  l1.indexOf("Ahmedabad");
  l1[index] = "surat";
  stdout.writeln(l1);
}