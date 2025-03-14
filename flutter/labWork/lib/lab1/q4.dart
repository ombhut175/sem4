import 'dart:io';

void main(){
  int sum = 0;
  for(int i=1;i<=5;i++){
    stdout.writeln("enter for subject $i");
    int mark = int.parse(stdin.readLineSync()!);
    sum+=mark;
  }
    stdout.writeln(double.parse("${sum / 5}"));
}