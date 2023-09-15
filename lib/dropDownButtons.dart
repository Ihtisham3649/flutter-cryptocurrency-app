import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'coin_data.dart';

//cupertino picker IOS
CupertinoPicker iosPicker(){
  List<Widget> pickerList = [];
  for(String currency in currenciesList){
    var currentItem =  Text(currency);
    pickerList.add(currentItem);
  }

  return CupertinoPicker(
    backgroundColor: Colors.lightBlue,
    itemExtent: 32.0,
    onSelectedItemChanged: (int value) {
      print(value);
    },
    children: pickerList,
  );
}

//andriod dropdown functionalities
List<DropdownMenuItem<String>> dropDownFunction(){
  List<DropdownMenuItem<String>> dropDownMenu = [];
  for (var currency in currenciesList) {
    var menu = DropdownMenuItem(
      value: currency,
      child: Text(currency),
    );
    dropDownMenu.add(menu);
  }
  return dropDownMenu;
}


