import 'dart:io';

import 'package:labwork/crud/user.dart';


void main(){
  User user = User();
  int choice;
  do{
    stdout.writeln('enter 1 for insert \n 2 for update \n 3 for get all \n 4 for getById \n 5 for deleteById \n 6 to update required \n7 to search\n 8 to exit');
    choice = int.parse(stdin.readLineSync()!);
    switch(choice){
      case 1:
        stdout.writeln("enter name");
        String name = stdin.readLineSync()!;
        stdout.writeln("enter age");
        int age = int.parse(stdin.readLineSync()!);
        stdout.writeln("enter email");
        String email = stdin.readLineSync()!;
        user.addUser(name: name, age: age, email: email);
      case 2:
        stdout.writeln("enter id");
        int index = int.parse(stdin.readLineSync()!);
        stdout.writeln("enter name");
        String name = stdin.readLineSync()!;
        stdout.writeln("enter age");
        int age = int.parse(stdin.readLineSync()!);
        stdout.writeln("enter email");
        String email = stdin.readLineSync()!;
        user.updateUser(name: name, age: age, email: email, id: index);
      case 3:
        List<Map<String,dynamic>> userList = user.getUsers();
        stdout.writeln(userList);
      case 4:
        stdout.writeln("enter id");
        int index = int.parse(stdin.readLineSync()!);
        Map<String,dynamic> oneUser = user.getUserById(id: index);
        stdout.writeln(oneUser);
      case 5:
        stdout.writeln("enter id");
        int index = int.parse(stdin.readLineSync()!);
        user.deleteUserById(id: index);
      case 6:
        stdout.writeln("enter id");
        int index = int.parse(stdin.readLineSync()!);
        int choice2;
        String? name;
        int? age;
        String? email;
        do{
          stdout.writeln("1 for changeName\n 2 for age\n 3 for email\n 4 to stop");
          choice2 = int.parse(stdin.readLineSync()!);
          switch(choice2){
            case 1:
              stdout.writeln("enter name");
              name = stdin.readLineSync()!;
            case 2:
              stdout.writeln("enter age");
              age = int.parse(stdin.readLineSync()!);
            case 3:
              stdout.writeln("enter email");
              email = stdin.readLineSync()!;
            default:
              break;
            }
              }while(choice2!=4);
        user.updateUserRequired(name: name,age: age,email: email,id: index);
      case 7:
        stdout.writeln("Enter value to search");
        String s = stdin.readLineSync()!;
        user.searchDetail(searchData: s);
      default:
        break;
    }
  }while(choice!=8);
}