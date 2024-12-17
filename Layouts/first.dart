import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class First extends StatelessWidget{
  const First({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.lightBlueAccent,
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  flex:3,
                  child: Container(
                    color: Colors.blue,
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Expanded(child: Container(
                        color: Colors.purple,
                      )),
                      Expanded(child: Container(
                        color: Colors.yellow,
                      )),
                    ],
                  ),
                ),
                Expanded(child: Row(
                  children: [
                    Expanded(child: Container(
                      color: Colors.green,
                    ))
                  ],
                ))
              ],
            )
          ),
          Expanded(child: Row(
            children: [
              Expanded(child: Container(
                color: Colors.greenAccent,
              )),
              Expanded(child: Container(
                color: Colors.deepOrange,
              )),
              Expanded(child: Container(
                color: Colors.red,
              )),
            ],
          ))
        ],
      ),
    );
  }
}