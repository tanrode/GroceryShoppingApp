import 'package:flutter/material.dart';
import './button.dart';
import './cost_button.dart';
import './redirect.dart';

void main() {
  runApp(GroceryApp());
}

class GroceryApp extends StatefulWidget {
  @override
  _GroceryAppState createState() => _GroceryAppState();
}

class _GroceryAppState extends State<GroceryApp> {
  var fruits = [
    {'it': 'Apple (Rs.180/- Kg)', 'price': 180.00},
    {'it': 'Orange (Rs.90/- Kg)', 'price': 90.00},
    {'it': 'Musk Melon (Rs.80/-)', 'price': 80.00},
  ];

  var vegs = [
    {'it': 'Spinach (Rs.30/- per bundle)', 'price': 30.00},
    {'it': 'Capsicum (Rs.90/- Kg)', 'price': 90.00},
    {'it': 'Brinjal (Rs.72/- Kg)', 'price': 72.00},
  ];

  var snacks = [
    {'it': 'Maggi (Rs.35/-)', 'price': 35.00},
    {'it': 'Doritos (Rs.90/-)', 'price': 90.00},
    {'it': 'Mixture (Rs.45/-)', 'price': 45.00},
  ];

  var bakery = [
    {'it': 'Cake (Rs.75/-)', 'price': 75.00},
    {'it': 'Cottage Cheese (Rs.40/-)', 'price': 40.00},
    {'it': 'Eggs (Rs.5/- per piece)', 'price': 5.00},
  ];

  var kitchen = [
    {'it': 'Apron (Rs.105/-)', 'price': 105.00},
    {'it': 'Dishwash Soap (Rs.60/-)', 'price': 60.00},
    {'it': 'Scrub Pad (Rs.25/-)', 'price': 25.00},
  ];

  var cost = 0.0;
  var cats = ['Fruits', 'Vegetables', 'Snacks', 'Bakery', 'Kitchen'];
  var fr = 0, vg = 0, sn = 0, bk = 0, ktn = 0, getInvoice = 0;

  void reset() {
    setState(() {
      fr = 0;
      vg = 0;
      sn = 0;
      bk = 0;
      ktn = 0;
      getInvoice = 0;
    });
  }

  void resetTotal() {
    setState(() {
      fr = 0;
      vg = 0;
      sn = 0;
      bk = 0;
      ktn = 0;
      getInvoice = 0;
      cost=0.0;
    });
  }

  void addCost(double amt) {
    setState(() {
      cost += amt;
     // getInvoice = 0;
    });
  }

  void getFruits() {
    setState(() {
      fr = 1;
    });
  }

  void getVegs() {
    setState(() {
      vg = 1;
    });
  }

  void getSnacks() {
    setState(() {
      sn = 1;
    });
  }

  void getBaks() {
    setState(() {
      bk = 1;
    });
  }

  void getKitchs() {
    setState(() {
      ktn = 1;
    });
  }

  void invoice() {
    setState(() {
      fr = 0;
      vg = 0;
      sn = 0;
      bk = 0;
      ktn = 0;
      getInvoice = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ApnaBazaar'),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(200, 75, 180, 0.8),
        ),
        body: Container(
          width: double.infinity,
          margin: EdgeInsets.all(8),
          child: fr == 0 &&
                  vg == 0 &&
                  sn == 0 &&
                  bk == 0 &&
                  ktn == 0 && getInvoice==0
              ? Column(
                  children: <Widget>[
                    Text('Welcome to ApnaBazaar',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        )),
                    Text('Select a category:',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        )),
                    Buttons(catName: cats[0], getList: getFruits),
                    Buttons(catName: cats[1], getList: getVegs),
                    Buttons(catName: cats[2], getList: getSnacks),
                    Buttons(catName: cats[3], getList: getBaks),
                    Buttons(catName: cats[4], getList: getKitchs),
                    Text(''),
                    Text('Current Bill Amount: '),
                    Text('Rs.'+cost.toString(),textAlign: TextAlign.center,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,)),
                    Text(''),
                    RaisedButton(
                        child: Text('Proceed to Pay'), onPressed: invoice),
                  ],
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                )
              : fr == 1
                  ? Column(
                      children: [
                        CostButton(addCost,
                            fruits[0]['it'], fruits[0]['price']),
                        CostButton(addCost,
                            fruits[1]['it'], fruits[1]['price']),
                        CostButton(addCost,
                            fruits[2]['it'], fruits[2]['price']),
                        Text(''),
                        Text('Current Bill Amount: '),
                        Text('Rs.'+cost.toString(),textAlign: TextAlign.center,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,)),
                        Text(''),    
                        RaisedButton(
                            child: Text('Proceed to Pay'), onPressed: invoice),
                        RaisedButton(
                            child: Text('Back to Main Menu'), onPressed: reset),
                      ],
                    )
                  : vg == 1
                      ? Column(
                          children: [
                            CostButton(addCost,
                                vegs[0]['it'], vegs[0]['price']),
                            CostButton(addCost,
                                vegs[1]['it'], vegs[1]['price']),
                            CostButton(addCost,
                                vegs[2]['it'], vegs[2]['price']),
                            Text(''),
                            Text('Current Bill Amount: '),
                            Text('Rs.'+cost.toString(),textAlign: TextAlign.center,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,)),
                            Text(''),
                            RaisedButton(
                                child: Text('Proceed to Pay'),
                                onPressed: invoice),
                            RaisedButton(
                                child: Text('Back to Main Menu'),
                                onPressed: reset),
                          ],
                        )
                      : sn == 1
                          ? Column(
                              children: [
                                CostButton(addCost,
                                    snacks[0]['it'], snacks[0]['price']),
                                CostButton(addCost,
                                    snacks[1]['it'], snacks[1]['price']),
                                CostButton(addCost,
                                    snacks[2]['it'], snacks[2]['price']),
                                Text(''),
                                Text('Current Bill Amount: '),
                                Text('Rs.'+cost.toString(),textAlign: TextAlign.center,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,)),
                                Text(''),

                                RaisedButton(
                                    child: Text('Proceed to Pay'),
                                    onPressed: invoice),
                                RaisedButton(
                                    child: Text('Back to Main Menu'),
                                    onPressed: reset),
                              ],
                            )
                          : bk == 1
                              ? Column(
                                  children: [
                                    CostButton(
                                        addCost,
                                        bakery[0]['it'],
                                        bakery[0]['price']),
                                    CostButton(
                                        addCost,
                                        bakery[1]['it'],
                                        bakery[1]['price']),
                                    CostButton(
                                        addCost,
                                        bakery[2]['it'],
                                        bakery[2]['price']),
                                    Text(''),
                                    Text('Current Bill Amount: '),
                                    Text('Rs.'+cost.toString(),textAlign: TextAlign.center,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,)),
                                    Text(''),

                                    RaisedButton(
                                        child: Text('Proceed to Pay'),
                                        onPressed: invoice),
                                    RaisedButton(
                                        child: Text('Back to Main Menu'),
                                        onPressed: reset),
                                  ],
                                )
                              : ktn == 1
                                  ? Column(
                                      children: [
                                        CostButton(
                                            addCost,
                                            kitchen[0]['it'],
                                            kitchen[0]['price']),
                                        CostButton(
                                            addCost,
                                            kitchen[1]['it'],
                                            kitchen[1]['price']),
                                        CostButton(
                                            addCost,
                                            kitchen[2]['it'],
                                            kitchen[2]['price']),
                                          Text(''),
                                          Text('Current Bill Amount: '),
                                          Text('Rs.'+cost.toString(),textAlign: TextAlign.center,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,)),
                                          Text(''),

                                        RaisedButton(
                                            child: Text('Proceed to Pay'),
                                            onPressed: invoice),
                                        RaisedButton(
                                            child: Text('Back to Main Menu'),
                                            onPressed: reset),
                                      ],
                                    )
                                  : getInvoice==1
                                      ? 
                                      Redirect(cost,reset,resetTotal):
                                      Column(
                                          children: <Widget>[
                                            Text('Welcome to ApnaBazaar',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 35,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                            Text('Select a category:',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                            Buttons(
                                                catName: cats[0],
                                                getList: getFruits),
                                            Buttons(
                                                catName: cats[1],
                                                getList: getVegs),
                                            Buttons(
                                                catName: cats[2],
                                                getList: getSnacks),
                                            Buttons(
                                                catName: cats[3],
                                                getList: getBaks),
                                            Buttons(
                                                catName: cats[4],
                                                getList: getKitchs),
                                          ],
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                        ),
        ),
      ),
    );
  }
}
