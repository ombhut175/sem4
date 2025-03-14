// WAP to print reverse string.
import 'dart:io';

void main(){
    stdout.writeln("enter string");
    String s = stdin.readLineSync()!;
    for(int i=s.length-1;i>=0;i--){
      stdout.write(s[i]);
    }
}