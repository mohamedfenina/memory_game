import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

Widget ScoreBord(String title,String info){
  return Expanded(
    child: Container(
      margin: EdgeInsets.all(26),
      padding: EdgeInsets.symmetric(
        vertical: 6,
        horizontal: 22,
        
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6)
      ),
      child: Column(

         children: [
           Text(title,style: TextStyle(
             fontSize: 22,
             fontWeight:FontWeight.bold,

           ),),
           SizedBox(
             height: 6,
           ),
           Text(info,style: TextStyle(
             fontSize: 34,
             fontWeight:FontWeight.bold,

           ),),
         ],
      ),
    ),
  );
}