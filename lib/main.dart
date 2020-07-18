import 'package:flutter/material.dart';
import 'reusable.dart';
import 'gender.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const activeColor = Color(0xFF1D1E33);
const inactiveColor = Color(0xFF111328);

enum Gender1 {
  male,
  female,
}

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.white),
        ),
      ),
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender1 selectedGender;

  Color maleCardColor = inactiveColor;
  Color femaleCardColor = inactiveColor;

  void updateColor(Gender1 gender) {
    maleCardColor =
        maleCardColor == inactiveColor ? activeColor : inactiveColor;
    if (gender == Gender1.male) {
      if (maleCardColor == inactiveColor) {
        maleCardColor = activeColor;
        femaleCardColor = inactiveColor;
      } else {
        maleCardColor = inactiveColor;
      }
    } else if (gender == Gender1.female) {
      if (femaleCardColor == inactiveColor) {
        femaleCardColor = activeColor;
        maleCardColor = inactiveColor;
      } else {
        femaleCardColor = inactiveColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Reusable(
                    press: () {
                      setState(() {
                        selectedGender = Gender1.male;
                      });
                    },
                    color: selectedGender == Gender1.male
                        ? activeColor
                        : inactiveColor,
                    child: Gender(
                      text: 'MALE',
                      icon: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
                Expanded(
                  child: Reusable(
                    press: () {
                      setState(() {
                        selectedGender = Gender1.female;
                      });
                    },
                    color: selectedGender == Gender1.female
                        ? activeColor
                        : inactiveColor,
                    child: Gender(
                      text: 'FEMALE',
                      icon: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
              ],
            ),
          ),
//          Expanded(
//            child: Reusable(activeColor),
//          ),
//          Expanded(
//            child: Row(
//              children: <Widget>[
//                Expanded(
//                  child: Reusable(activeColor),
//                ),
//                Expanded(
//                  child: Reusable(activeColor),
//                ),
//              ],
//            ),
//          ),
          Container(
            color: Color(0xFFEB1555),
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: 80.0,
          ),
        ],
      ),
    );
  }
}
