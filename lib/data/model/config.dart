import 'package:flutter/material.dart';
import 'package:prototipo_personalizacao/extensions/colors.dart';

class Config {
  String? name;
  String? primaryColor = Colors.blue.toHex();
  String? secondaryColor = Colors.orangeAccent.toHex();
  String? textColor = Colors.black.toHex();
  String? backgroundColor = Colors.white.toHex();
  String? secondaryTextColor = Colors.grey.toHex();
  String? listType;
  bool? showExercisePhoto = true;
  String? logoColor = Colors.white.toHex();
  String? headingTextFont = "Roboto";
  String? subtitleTextFont = "Roboto";
  String? bodyTextFont = "Roboto";
  bool? blackPageTitle = false;

  Config(
      {this.name,
      this.primaryColor,
      this.secondaryColor,
      this.textColor,
      this.backgroundColor,
      this.listType,
      this.secondaryTextColor,
      this.showExercisePhoto,
      this.subtitleTextFont,
      this.logoColor,
      this.headingTextFont,
      this.bodyTextFont,
      this.blackPageTitle});

  Config.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    primaryColor = json['primaryColor'];
    secondaryColor = json['secondaryColor'];
    secondaryTextColor = json['secondaryTextColor'];
    textColor = json['textColor'];
    backgroundColor = json['backgroundColor'];
    listType = json['listType'];
    showExercisePhoto = json['showExercisePhoto'];
    logoColor = json['logoColor'];
    headingTextFont = json['headingTextFont'];
    bodyTextFont = json['bodyTextFont'];
    blackPageTitle = json['blackPageTitle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['primaryColor'] = primaryColor;
    data['secondaryColor'] = secondaryColor;
    data['textColor'] = textColor;
    data['backgroundColor'] = backgroundColor;
    data['listType'] = listType;
    data['logoColor'] = logoColor;
    data['headingTextFont'] = headingTextFont;
    data['bodyTextFont'] = bodyTextFont;
    data['blackPageTitle'] = blackPageTitle;
    data['secondaryTextColor'] = secondaryTextColor;
    return data;
  }
}
