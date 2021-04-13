import 'package:flutter/material.dart';


class SIForm extends StatefulWidget {
  @override
  _SIFormState createState() => _SIFormState();
}

class _SIFormState extends State<SIForm> {
  var _formKey = GlobalKey<FormState>();
  final _minimumPadding = 5.0;
  var _currencies = ['Rupees', 'Dollar', 'Yen', 'Pesos'];
  var currencyType = '';
  var result = "";
  TextEditingController principalController = TextEditingController();
  TextEditingController roiController = TextEditingController();
  TextEditingController termsController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currencyType = _currencies[0];
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.title;
    return Scaffold(
        appBar: AppBar(
          title: Text("SI Calculator"),
        ),
        body: Form(
          key: _formKey,
          child: Padding(
              padding: EdgeInsets.all(_minimumPadding * 2),
              child: ListView(children: [
                getImageAsset(),
                getPrincipalUi(textStyle),
                getRateOfInterestUi(textStyle),
                termAndRupeesUi(textStyle),
                btnHandlerUi(),
                Padding(
                    padding: EdgeInsets.all(_minimumPadding * 2),
                    child: Text(this.result, textAlign: TextAlign.center))
              ])),
        ));
  }

  Widget getImageAsset() {
    return Container(
      child: Image(
          image: AssetImage('assets/images/bank.png'),
          width: 125.0,
          height: 125.0),
      margin: EdgeInsets.all(_minimumPadding * 10),
    );
  }

  Widget getPrincipalUi(TextStyle textStyle) {
    return Padding(
        padding: EdgeInsets.only(top: _minimumPadding, bottom: _minimumPadding),
        child: TextFormField(
          controller: principalController,
          style: textStyle,
          validator: (String val) {
            if (val.isEmpty) {
              return 'Please Enter Principal Amount';
            } else {
              return '';
            }
          },
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              labelText: 'Principal',
              labelStyle: textStyle,
              hintText: 'Enter Principal e.g 12000',
              errorStyle: TextStyle(color: Colors.yellowAccent, fontSize: 15.0),
              border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
        ));
  }

  Widget getRateOfInterestUi(TextStyle textStyle) {
    return Padding(
        padding: EdgeInsets.only(top: _minimumPadding, bottom: _minimumPadding),
        child: TextFormField(
          validator: (String val) {
            if (val.isEmpty) return 'Please enter rate of interest';
            else return '';
          },
          controller: roiController,
          style: textStyle,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              labelStyle: textStyle,
              labelText: 'Rate of Interest',
              hintText: 'In percent',
              errorStyle: TextStyle(
                  color: Colors.yellowAccent,
                  fontSize: 15.0
              ),
              border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
        ));
  }

  Widget termAndRupeesUi(TextStyle textStyle) {
    return Padding(
        padding: EdgeInsets.only(top: _minimumPadding, bottom: _minimumPadding),
        child: Row(
          children: [
            Expanded(
                child: TextFormField(
                  validator: (String val){
                    if(val.isEmpty) return 'Please enter terms';
                    else return '';
                  },
                  controller: termsController,
                  style: textStyle,
                  decoration: InputDecoration(
                      errorStyle: TextStyle(
                          color: Colors.yellowAccent,
                          fontSize: 15.0
                      ),
                      labelStyle: textStyle,
                      labelText: 'Term',
                      hintText: 'Time in years',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                )),
            Container(
              width: _minimumPadding * 5,
            ),
            Expanded(
                child: DropdownButton(
                  items: _currencies.map((String value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  value: currencyType,
                  onChanged: (String newValueSelected) {
                    setState(() {
                      currencyType = newValueSelected;
                    });
                  },
                ))
          ],
        ));
  }

  Widget btnHandlerUi() {
    return Padding(
        padding: EdgeInsets.only(top: _minimumPadding, bottom: _minimumPadding),
        child: Row(
          children: [
            Expanded(
              child: RaisedButton(
                color: Theme.of(context).accentColor,
                textColor: Theme.of(context).primaryColorDark,
                child: Text(
                  'Calculate',
                  textScaleFactor: 1.5,
                ),
                onPressed: () => {
                  this.setState(() {
                    if (_formKey.currentState.validate()) {
                      result = _calculateTotalReturns();
                    }
                  })
                },
              ),
            ),
            Expanded(
              child: RaisedButton(
                color: Theme.of(context).primaryColorDark,
                textColor: Theme.of(context).primaryColorLight,
                child: Text(
                  'Reset',
                  textScaleFactor: 1.5,
                ),
                onPressed: () => {_reset()},
              ),
            )
          ],
        ));
  }

  String _calculateTotalReturns() {
    double principal = double.parse(principalController.text);
    double roi = double.parse(roiController.text);
    double term = double.parse(termsController.text);

    double totalAmountPayable = principal + (principal * roi * term) / 100;
    return 'After $term years, your investment will be worth $totalAmountPayable $currencyType';
  }

  void _reset() {
    principalController.text = '';
    roiController.text = '';
    termsController.text = '';
    result = '';
    currencyType = _currencies[0];
  }
}