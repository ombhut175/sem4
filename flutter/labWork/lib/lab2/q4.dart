// WAP to read marks of five subjects. Calculate percentage and print class accordingly. Fail
// below 35, Pass Class between 35 to 45, Second Class between 45 to 60, First Class between 60
// to 70, Distinction if more than 70.
import 'dart:ffi';
import 'dart:io';

void main(){
    // List l1 = [];
    int totalMarks = 0;
    for(int i=1;i<=5;i++){
      stdout.writeln("enter marks of subject $i");
      int n = int.parse(stdin.readLineSync()!);
      totalMarks+=n;
      // l1.add(n);
    }
    double percentage = totalMarks/5;
    if(percentage<35){
      stdout.writeln("fail");
    }else if(percentage>=35 && percentage<=45){
      print('Pass');
    }else if(percentage>45 && percentage<=60){
      print('Second');
    }else if(percentage>60 && percentage<=70){
      print('First');
    }else if(percentage>70){
      print('Distinction');
  }
}