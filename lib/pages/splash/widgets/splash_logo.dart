import 'package:flutter/material.dart';
import 'package:prototipo_personalizacao/extensions/colors.dart';

class SplashLogo extends StatelessWidget {
  SplashLogo({Key? key, required this.color, this.height}) : super(key: key);
  String color;
  double? height;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/img/logo.png",
      color: HexColor.fromHex(color),
      height: height ?? 100,
    );
  }
}
