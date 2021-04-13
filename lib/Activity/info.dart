import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartpaies/Config/palette.dart';
import 'dart:math' as math;

class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  var forms = ['urlForm', 'empCode', 'Otp', 'generateMpin', 'validateMpin'];
  var currentForms = '';
  var url,empCode,otp,generateMpin,validateOTP;

  TextEditingController urlFormController = TextEditingController();
  TextEditingController empCodeController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController generateMpinController = TextEditingController();
  TextEditingController validateMpinController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentForms = forms[0];
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Palette.backgroundColor,
      body: Stack(
        children: [
          Positioned(
              top: 60,
              right: 0,
              left: 0,
              child: Container(
                  height: 150.0,
                  width: size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              "assets/images/payroll_illustration.png"),
                          scale: 1)))),
          Positioned(child:Align(
            alignment: Alignment.center,
            child: getFormHere(),
          )),
          Align(
              alignment: Alignment(size.width, .66),
              child: Positioned(
                  right: 0,
                  left: 0,
                  child: GestureDetector(
                      onTap: onButtonClicked,
                      child: Container(
                          height: 120.0,
                          width: size.width,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage("assets/images/ic_submit.png"),
                          )))))),
          Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Transform.rotate(
                  angle: 180 * math.pi / 180,
                  child: Container(
                    height: 120.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/footer_wave.png"),
                            fit: BoxFit.fill)),
                  )))
        ],
      ),
    );
  }

  void onButtonClicked() {
    switch (currentForms) {
      case 'urlForm':
        return urlFormClicked();
      case 'empCode':
        return empFormClicked();
      case 'Otp':
        return otpFormClicked();
      case 'generateMpin':
        return generateMpinClicked();
      case 'validateMpin':
        return validateMpinClicked();
    }
  }

  Widget getFormHere() {
    switch (currentForms) {
      case 'urlForm':
        return urlForm();
      case 'empCode':
        return empCodeWidget();
      case 'Otp':
        return otpFormWidget();
      case 'generateMpin':
        return generateMpinWidget();
      case 'validateMpin':
        return validateMpinWidget();
    }
  }

  Widget urlForm() {
    return Padding(
      padding: EdgeInsets.only(left: 40.0, right: 40.0),
      child: TextFormField(
        controller: urlFormController,
        validator: (String val) {
          if (val.isEmpty)
            return 'Please enter Payroll url';
          else
            return '';
        },
        keyboardType: TextInputType.text,
        decoration:
            InputDecoration(labelText: 'Enter Payroll url', hintText: 'URL'),
      ),
    );
  }

  Widget empCodeWidget() {
    return Padding(
      padding: EdgeInsets.only(left: 40.0, right: 40.0),
      child: TextFormField(
        controller: empCodeController,
        validator: (String val) {
          if (val.isEmpty)
            return 'Please enter Emp Code';
          else
            return '';
        },
        keyboardType: TextInputType.text,
        decoration:
            InputDecoration(labelText: 'Enter emp code', hintText: 'code'),
      ),
    );
  }
  Widget otpFormWidget() {
    return Padding(
      padding: EdgeInsets.only(left: 40.0, right: 40.0),
      child: TextFormField(
        controller: otpController,
        validator: (String val) {
          if (val.isEmpty)
            return 'Please Enter OTP';
          else
            return '';
        },
        keyboardType: TextInputType.text,
        decoration:
        InputDecoration(labelText: 'Enter OTP', hintText: 'OTP'),
      ),
    );
  }
  Widget generateMpinWidget() {
    return Padding(
      padding: EdgeInsets.only(left: 40.0, right: 40.0),
      child: TextFormField(
        controller: generateMpinController,
        validator: (String val) {
          if (val.isEmpty)
            return 'Choose your MPIN';
          else
            return '';
        },
        keyboardType: TextInputType.text,
        decoration:
        InputDecoration(labelText: 'Enter your mPin', hintText: 'MPIN'),
      ),
    );
  }
  Widget validateMpinWidget() {
    return Padding(
      padding: EdgeInsets.only(left: 40.0, right: 40.0),
      child: TextFormField(
        controller: validateMpinController,
        validator: (String val) {
          if (val.isEmpty)
            return 'Please Enter your mPin';
          else
            return '';
        },
        keyboardType: TextInputType.text,
        decoration:
        InputDecoration(labelText: 'Enter MPIN', hintText: 'MPIN'),
      ),
    );
  }

  void urlFormClicked() {
    this.setState(() {
      url = urlFormController.text;
      urlFormController.text = '';
      currentForms = forms[1];
    });
  }

  void empFormClicked() {
    empCode = empCodeController.text;
    empCodeController.text = '';
    this.setState(() {
      currentForms = forms[2];
    });
  }
  void otpFormClicked() {
    otp = otpController.text;
    otpController.text = '';
    this.setState(() {
      currentForms = forms[3];
    });
  }
  void generateMpinClicked() {
    generateMpin = generateMpinController.text;
    generateMpinController.text = '';
    this.setState(() {
      currentForms = forms[4];
    });
  }
  void validateMpinClicked() {
    print('url $url, EmpCode $empCode, OTP $otp, MPIN $generateMpin');
    this.setState(() {

    });
  }
}
