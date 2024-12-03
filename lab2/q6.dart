// WAP to make a Simple Calculator using switch...case

import 'dart:io';

void main(){
  String s = stdin.readLineSync()!;
  var list = s.split(" ");
  for(int i=0;i<list.length;i++){
      if(list[i]=='('){

      }
  }
}



void calcy(List<int> list,int start,int end){
      
}


bool canBeConvertedToNumber(String character){
  return int.tryParse(character) != null;
}