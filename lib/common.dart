import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Common{



  static Widget button({required GestureTapCallback onTap, required String text}){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 120,vertical: 15),
        decoration: BoxDecoration(
          color: Colors.blue.shade600,
          borderRadius: BorderRadius.circular(15),
        ),

        child: Text(text,style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),),
      ),
    ) ;
  }
}