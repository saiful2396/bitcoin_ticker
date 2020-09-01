import 'dart:convert';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BDT',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];
const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];
const apiKey = '0BFBADF8-81E0-4A31-881E-9C33068F9AA0';
const url = 'https://rest.coinapi.io/v1/exchangerate';

class CoinData {
  final String asset_id_base;
  final String asset_id_quote;
  final int rate;

  CoinData({this.asset_id_base, this.asset_id_quote, this.rate});

  Future getCoinData() async {
    String requestURL = '$url/BTC/USD?apikey=$apiKey';
    var response = await http.get(requestURL);

    if(response.statusCode == 200){
      var decodeData = jsonDecode(response.body);
      var rate = decodeData['rate'];
    return rate;
    }else{
      print(response.statusCode);
    }
  }

}
