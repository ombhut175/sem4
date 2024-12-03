import 'dart:io';

void main(){
    stdout.writeln("enter meter");
    int meter = int.parse(stdin.readLineSync()!);
    double feet = 3.28084 * meter;
    stdout.writeln(feet);
}