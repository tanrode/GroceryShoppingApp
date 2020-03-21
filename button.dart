import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final Function getList;
  final String catName;

  Buttons({this.getList,this.catName});
  @override
  Widget build(BuildContext context) {
    return Container(
      width:double.infinity,
      margin: EdgeInsets.all(10),
      color: Color.fromRGBO(0, 255, 0, 0.7),
      child: RaisedButton(child: Text(catName,style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,)),onPressed: () => getList()),
    );
  }
}