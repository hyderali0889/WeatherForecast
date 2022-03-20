import 'package:flutter/cupertino.dart';
import 'homestyles.dart';

class HomeWidgets { 
var theme = HomeStyles();
  contWidget(){
     return Container(
       padding:const EdgeInsets.all(4.0), 
       child: Column(  
         children: [ 
           Text("Donkey" , style: theme.headingText(), ),
           Text("Horse" ,  style: theme.headingText(),)
          ],
       ),
      );
  }
 }