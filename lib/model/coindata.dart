import 'dart:convert';
import 'package:bitcoin_ticker/widget/constant.dart';
import 'package:http/http.dart' as http;

class CoinData {
  Future getCoinData(String selectedCurrency) async {

    Map<String, String> cryptoPrices = {};

    for (String crypto in cryptoList) {
      String requestURL = '$url/$crypto/$selectedCurrency?apikey=$apiKey';
      http.Response response = await http.get(requestURL);

      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        double rate = decodedData['rate'];
        cryptoPrices[crypto] = rate.toStringAsFixed(2);
      } else {
        print(response.statusCode);
        throw'Problem with the get request';
      }
    }
    return cryptoPrices;
  }
}