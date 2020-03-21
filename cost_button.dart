import 'package:flutter/material.dart';

class CostButton extends StatelessWidget {
  final Function getList;
  final String catName;
  final double price;

  CostButton(this.getList,this.catName,this.price);
  @override
  Widget build(BuildContext context) {
    return Container(
      width:double.infinity,
      margin: EdgeInsets.all(10),
      color: Color.fromRGBO(0, 255, 0, 0.7),
      child: RaisedButton(child: Text(catName,style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,)),onPressed: () => getList(price)),
    );
  }
}