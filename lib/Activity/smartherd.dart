import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoriteCity extends StatefulWidget {
  @override
  _FavoriteCityState createState() => _FavoriteCityState();
}

class _FavoriteCityState extends State<FavoriteCity> {
  String cityName = "";
  var _currencies = ['Rupees','Dollar','Pounds','Others'];
  var _currentItemSelected = 'Rupees';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("STF Example"),
      ),
      body: Container(
        margin: EdgeInsets.all(30.0),
        child: Column(
          children: [
            TextField(onSubmitted: (String userInput) => {
              this.setState(() {
                  cityName = userInput;
              })
            }),
            DropdownButton(
              items: _currencies.map((String dropDownStringItem){
                return DropdownMenuItem<String>(
                  value:dropDownStringItem,
                  child:Text(dropDownStringItem)
                );
              }).toList(),
              onChanged: (String userSelectedItem){
                _onDropDownItemSelected(userSelectedItem);
              },
              value: _currentItemSelected,
            ),
            Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "Your best city is $cityName",
                  style: TextStyle(fontSize: 20),
                ))
          ],
        ),
      ),
    );
  }
  void _onDropDownItemSelected(String item){
    setState(() {
      _currentItemSelected = item;
    });
  }
}
