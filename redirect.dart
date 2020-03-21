import 'package:flutter/material.dart';
import './button.dart';

class Redirect extends StatelessWidget {
  final double amt;
  final Function reset;
  final Function resetTotal;

  Redirect(this.amt,this.reset,this.resetTotal);
  @override
  Widget build(BuildContext context) {
    return Container(child:
      Column(children: <Widget>[
            Text('Your Bill Amount is',textAlign: TextAlign.center,style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,)),
            Text('Rs.'+amt.toString(),textAlign: TextAlign.center,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,)),
            Text(''),
            Text('Thank you for Shopping with us.',textAlign: TextAlign.center,style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,)),
            Text(''),
            RaisedButton(child: Text('Continue Shopping'),onPressed: reset),
            RaisedButton(child: Text('Reset Cart'),onPressed: resetTotal),
        ],mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.center,),
    );
  }
}