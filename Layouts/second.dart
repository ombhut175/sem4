import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Second extends StatelessWidget{
  const Second({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.tealAccent,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.orangeAccent,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.deepOrangeAccent,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    color: Colors.blue,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    color: Colors.red,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.green,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.purple,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    color: Colors.cyan,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.pink,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}