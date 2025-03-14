import 'dart:io';

void main(){
  stdout.writeln("enter number");
  int n = int.parse(stdin.readLineSync()!);
  var list = [];

  // if(n==1){
  //   stdout.writeln("ugly number");
  //   return;
  // }1
  if(n==2 || n==3 || n==5){
    stdout.writeln("$n is ugly");
    return;
  }

  for(int i=2;i<=n/2;i++){
    if(n%i==0) {
      list.add(i);
    }
  }
  // var check = [];
  if(list.isEmpty){
    stdout.writeln("$n is not ugly");
    return;
  }
  int count=0;
  for(int i=0;i<list.length;i++){
    if(!(list[i]==2 || list[i]==3 || list[i]==5)) continue;
    count++;
  }
  if(count<=3){
    stdout.writeln("$n is ugly");
  }else{
    stdout.writeln("$n is not ugly");
  }
}