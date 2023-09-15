import 'package:flutter/material.dart';

class CurrencyExchangeShow extends StatelessWidget {
  const CurrencyExchangeShow({
    super.key,
    required this.coinRate,
    required this.selectedCurrency,
    required this.CRYPTO,
  });

  final String? coinRate;
  final String selectedCurrency;
  final String? CRYPTO;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: const Color(0xFFDFB10D),
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child:  Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $CRYPTO = $coinRate $selectedCurrency',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}