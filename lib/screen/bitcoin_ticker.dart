import 'dart:io' show Platform;
import 'package:bitcoin_ticker/model/coindata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class BitcoinScreen extends StatefulWidget {
  @override
  _BitcoinScreenState createState() => _BitcoinScreenState();
}

class _BitcoinScreenState extends State<BitcoinScreen> {

  String selectedCurrency = 'BDT';
  String bitCoinValueInUSD = '?';

  void getRate() async{
    try {
      double data = await CoinData().getCoinData();
      setState(() {
        bitCoinValueInUSD = data.toStringAsFixed(0);
      });
    }catch(e) {
      print(e);
    }
  }
  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String currency in currenciesList) {
      var value = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropDownItems.add(value);
    }
    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropDownItems,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
        });
      },
    );
  }

  CupertinoPicker iOSPicker() {
    List<Text> pickerItems = [];
    for (String currency in currenciesList) {
      pickerItems.add(Text(
        currency,
        style: TextStyle(color: Colors.white),
      ));
    }
    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (value) {
        setState(() {
          selectedCurrency = value.toString();
        });
      },
      children: pickerItems,
    );
  }

  @override
  void initState() {
    super.initState();
    getRate();
  }

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
          Padding( padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card( color: Colors.teal[300],
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular( 10.0 ) ),
              child: Padding( padding: EdgeInsets.symmetric(
                  horizontal: 24.0, vertical: 15.0 ),
                child: Text( '1 BTC = $bitCoinValueInUSD USD', textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20.0, color: Colors.white ), ), ), ), ),
          Container( height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only( bottom: 30.0 ),
            color: Theme
                .of( context )
                .primaryColor,
            child: Platform.isIOS ? iOSPicker( ) : androidDropdown( ), ),
        ], ), );
  }
}
