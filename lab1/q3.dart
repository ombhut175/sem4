import 'dart:io';

void main(){
    stdout.writeln("Enter F");
    double f = double.parse(stdin.readLineSync()!);
    double c = (f-32)*(5/9);

    stdout.writeln("f = $f c = $c");
}