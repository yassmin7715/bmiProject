import 'package:flutter/material.dart';
import 'BottomButtonWidget.dart';


class ResultsPage extends StatelessWidget {
ResultsPage({@required this.bmiResult, @required this.resultText, @required this.tips});

  final String bmiResult;
  final String resultText;
  final String tips;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text('Your Result',
              style: TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
              )),
            ),
          ),
          Expanded(
              flex: 5,
              child: Card(
                colour: Color(0xFF424242),
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(resultText.toUpperCase(),
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                    Text(bmiResult,
                    style: TextStyle(
                      color: Color(0xFFAB47BC), 
                      fontSize: 50, 
                      fontWeight: FontWeight.bold,
                    ),),
                    Text(
                      tips,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
              )),
          BottomButton(
              onTap: () => Navigator.pop(context), 
              title:
               'RE-CALCULATE'
               
               )
        ],
      ),
    );
  }
}


class Card extends StatelessWidget {
  Card({@required this.colour, this.cardChild});

  final Color colour;
  final Widget cardChild;

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
