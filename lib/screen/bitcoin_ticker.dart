import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BitcoinScreen extends StatefulWidget {
  @override
  _BitcoinScreenState createState() => _BitcoinScreenState();
}

class _BitcoinScreenState extends State<BitcoinScreen> {

  String selectedCurrency = 'BDT';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BitCoin Ticker App'),
        centerTitle: true,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.teal[300],
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 15.0),
                child: Text(
                    '1 BTC = ? USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0, color: Colors.white
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Theme.of(context).primaryColor,
            child: DropdownButton(
              value: '$selectedCurrency',
              items: [
                DropdownMenuItem(
                  child: Text('BDT'),
                  value: 'BDT',
                ),
                DropdownMenuItem(
                  child: Text('USD'),
                  value: 'USD',
                ),
                DropdownMenuItem(
                  child: Text('EUR'),
                  value: 'EUR',
                ),
              ],
              onChanged: (value){
                setState(() {
                  selectedCurrency = value;
                });
              },
            ),
          ),
        ],
      ),

    );
  }
}
