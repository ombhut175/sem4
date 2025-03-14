// WAP to find friends detail by their name using dictionary. (Create local dictionary and search
// from it using Map<String,Object?> & Model Class).

import 'dart:io';

class Dic {
  String name= '';
  String num = '';
  Dic({String? name, String? num}){
    this.name = name!;
    this.num = num!;
  }
}


void main(){
  Map<String,Object?> m1= {
    "101": Dic(name:'Kishan',num:'019427y90')
  };
  Dic d1 = m1["101"] as Dic;
  stdout.writeln(d1.name);
}