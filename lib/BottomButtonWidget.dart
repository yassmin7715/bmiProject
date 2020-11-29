import 'package:flutter/material.dart';



class BottomButton extends StatelessWidget {
  BottomButton({@required this.onTap, @required this.title});
  final Function onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
            child: Text(
          title,
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
             ),
        )),
        color: Color(0xFFAB47BC),
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        padding: EdgeInsets.only(bottom: 20.0),
        height: 80.0,
      ),
    );
  }
}