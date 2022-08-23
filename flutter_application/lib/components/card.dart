import 'package:flutter/material.dart';

class card extends StatelessWidget {

   final color;
   final double width;
   final double height;
   final double marginLeft;
   final double marginTop;
   final double marginRight;
   final double marginBottom;
   final Widget child;
   final double alignmentX;
   final double alignmentY;


  const card({Key? key, required this.width, required this.height,required this.color,
            required this.marginLeft, required this.marginTop,required this.marginRight,
              required this.marginBottom,required this.child,required this.alignmentX, required this.alignmentY}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return (
        Container(
          width: width,
          height: height,
          color: Color(color),
          margin: EdgeInsets.fromLTRB(marginLeft, marginTop, marginRight, marginBottom),
          alignment: Alignment(alignmentX,alignmentY),
          child: child,
      )
    );
  }
}