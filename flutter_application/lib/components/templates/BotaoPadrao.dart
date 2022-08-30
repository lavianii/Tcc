import 'package:flutter/material.dart';
/*import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';*/

class BotaoPadrao extends StatelessWidget {
  final double paddingLeft;
  final double paddingTop;
  final double paddingRight;
  final double paddingBottom;
  final colorBackground;
  final colorText;
  final String text;
  final opacity;

  const BotaoPadrao({
    Key? key,
    required this.paddingLeft,
    required this.paddingTop,
    required this.paddingRight,
    required this.paddingBottom,
    required this.colorBackground,
    required this.colorText,
    required this.text,
    required this.opacity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.fromLTRB(
            paddingLeft,
            paddingTop,
            paddingRight,
            paddingBottom,
          ),
          primary: Color(colorBackground).withOpacity(opacity),
          onPrimary: Color(colorText),
          elevation: 0,
        ),
        onPressed: (() {}),
        child: Text(text),
      ),
    );
  }
}
