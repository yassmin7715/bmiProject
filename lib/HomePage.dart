import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'BottomButtonWidget.dart';
import 'calculator.dart';
import 'resultsPage.dart';


const activeCardColor = Color(0xFF424242);
const inactiveCardColor = Color(0xFF303030);

int height = 180;
int weight = 60;
int age = 20;



class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color maleCardColor = inactiveCardColor;
  Color femaleCardColor = inactiveCardColor;

  void updateColor(int gender) {
    if (gender == 1) {
      if (maleCardColor == inactiveCardColor) {
        maleCardColor = activeCardColor;
        femaleCardColor = inactiveCardColor;
      } else {
        maleCardColor = inactiveCardColor;
        femaleCardColor = activeCardColor;
      }
    }

    if (gender == 2) {
      if (femaleCardColor == inactiveCardColor) {
        maleCardColor = inactiveCardColor;
        femaleCardColor = activeCardColor;
      } else {
        femaleCardColor = inactiveCardColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      updateColor(1);
                    });
                  },
                  child: Card(
                    colour: maleCardColor,
                    cardChild: Content(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: Card(
                colour: femaleCardColor,
                cardChild: Content(
                  icon: FontAwesomeIcons.venus,
                  label: 'FEMALE',
                ),
              )),
            ],
          )),
          Expanded(
              child: Card(
            colour: activeCardColor,
            cardChild:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text('HEIGHT'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(height.toString()),
                  Text('cm'),
                ],
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: Colors.white,
                  inactiveTrackColor: Color(0xFF8D8E98),
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                  overlayColor: Color(0x29EB1555),
                  thumbColor: Color(0xFFAB47BC),
                ),
                child: Slider(
                  value: height.toDouble(),
                  min: 0.0,
                  max: 250.0,
                  onChanged: (double nvalue) {
                    setState(() {
                      height = nvalue.round();
                    });
                  },
                ),
              ),
            ]),
          )),
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: Card(
                  colour: activeCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('WEIGHT'),
                      Text(weight.toString()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundButton(icon: FontAwesomeIcons.plus, 
                          onPressed: () {
                            setState(() {
                                  weight++;
                                });
                          }),
                           SizedBox(
                              width: 10.0,
                            ),
                            RoundButton(icon: FontAwesomeIcons.minus,
                            onPressed: (){
                                setState(() {
                                  weight--;
                                });
                            })
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(child: Card(
                colour: activeCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('AGE'),
                    Text(age.toString()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundButton(
                        icon: FontAwesomeIcons.plus, 
                        onPressed: (){
                           setState(() {
                                  age++;
                                });
                        }),
                         SizedBox(
                              width: 10.0,
                            ),
                        RoundButton(
                          icon: FontAwesomeIcons.minus, 
                          onPressed: (){
                            setState(() {
                                  age--;
                                });
                          })
                      ],
                    )

                  ],
                ),),
                ),
            ],
          )),
         BottomButton(
              title: 'CALCULATE',
              onTap: () {
                {
                  Calculator calculate =
                      Calculator(height: height, weight: weight);
                      
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ResultsPage(bmiResult:calculate.CalculeBMI() ,
                      resultText: calculate.getResult() ,
                      tips: calculate.getTips(),
                      )));
                }
              }),
          
        ],
      ),
    );
  }
}

class Content extends StatelessWidget {
  Content({this.icon, this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
          color: Color(0xFFAB47BC),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          label,
          style: TextStyle(fontSize: 15, color: Colors.white),
        )
      ],
    );
  }
}


class RoundButton extends StatelessWidget {
  RoundButton({@required this.icon, @required this.onPressed});
  final IconData icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      elevation: 6.0,
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}

class Card extends StatelessWidget {
  Card({@required this.colour, this.cardChild});

  final Color colour;
  final Widget cardChild;
//
  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
