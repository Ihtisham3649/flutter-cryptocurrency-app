import 'package:flutter/material.dart';
import 'dropDownButtons.dart';
import 'dart:io';
import 'coin_data.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'currencyExchangeShow.dart';
import 'package:lottie/lottie.dart';

var apiKey = 'DCC6C608-B7EF-4BFB-A92B-D262CBC6FB94';

class PriceScreen extends StatefulWidget {
  @override
  PriceScreenState createState() => PriceScreenState();
}

class PriceScreenState extends State<PriceScreen> {
  //API REQUEST
  @override
  initState() {
    super.initState();
    getData();
  }

  String? coinRate;
  Map<String, String> crypto1 = {};

  Future apiRequest() async {
    Map<String, String> cryptoPrices = {};
    for (String crypto in cryptoList) {
      var url = Uri.parse(
          'https://rest.coinapi.io/v1/exchangerate/$crypto/$selectedCurrency?apikey=$apiKey');

      // Await the http get response, then decode the json-formatted response.
      var response = await http.get(url);
      if (response.statusCode == 200) {
        print('all okay');
        var jsonResponse = await JsonDecoder().convert(response.body);
        cryptoPrices[crypto] = jsonResponse['rate'].toStringAsFixed(0);
      } else {
        print(response.statusCode);
        throw (e) {
          return e;
        };
      }
    }
    return cryptoPrices;
  }

  Map<String, String> getDataOfCoins = {};
  void getData() async {
    getDataOfCoins = await apiRequest();
  }

//dropdown Menu
  String selectedCurrency = 'USD';
  DropdownButton<String> androidDropDown() {
    var dropDownMenu = dropDownFunction();
    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropDownMenu,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value!;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    apiRequest();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('🤑 Coin Ticker')),
          backgroundColor: const Color(0xFFDFB10D),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
                child: Column(
              children: [
                CurrencyExchangeShow(
                    coinRate: getDataOfCoins['BTC'],
                    selectedCurrency: selectedCurrency,
                    CRYPTO: 'BTC'),
                CurrencyExchangeShow(
                    coinRate: getDataOfCoins['ETH'],
                    selectedCurrency: selectedCurrency,
                    CRYPTO: 'ETH'),
                CurrencyExchangeShow(
                    coinRate: getDataOfCoins['LTC'],
                    selectedCurrency: selectedCurrency,
                    CRYPTO: 'LTC'),
              ],
            )),
            Lottie.asset('assets/coin.json',height: 100,width: 100),
            Container(
              height: 150.0,
              alignment: Alignment.center,
              padding: const EdgeInsets.only(bottom: 30.0),
              color: const Color(0xFFDFB10D),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  androidDropDown(),
                  const SizedBox(height: 5),
                   const Text('Select Fiat Currency',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500)),
                ],
              ),
              //Platform.isIOS ? iosPicker() : androidDropDown(),
            ),
          ],
        ),
      ),
    );
  }
}
