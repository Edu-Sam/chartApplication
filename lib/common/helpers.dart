// ignore_for_file: unnecessary_null_comparison

import 'dart:ui';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';

List<String> getKeysFromMapWithMaxKeys(List listOfMaps) {
  if (listOfMaps.isEmpty) return [];

  int maxKeys = 0;
  Map<String, dynamic> maxMap = {};

  for (var map in listOfMaps) {
    if (map.length > maxKeys) {
      maxKeys = map.length;
      maxMap = map;
    }
  }

  return maxMap.keys.toList();
}

bool isNumeric(String str) {
  return double.tryParse(str) != null;
}

String checkDataType(String input) {
  if (input.isEmpty) {
    return 'Empty';
  } else if (int.tryParse(input) != null) {
    return 'Integer';
  } else if (double.tryParse(input) != null) {
    return 'Double';
  } else {
    return 'String';
  }
}

Color getColorFromString(String colorString) {
  if (colorString.startsWith('#')) {
    colorString = colorString.substring(1);
  }

  if (colorString.length == 6) {
    // Handling the case without alpha
    int hexColor = int.parse('FF$colorString', radix: 16);
    return Color(hexColor);
  } else if (colorString.length == 8) {
    // Handling the case with alpha
    int hexColor = int.parse(colorString, radix: 16);
    return Color(hexColor);
  } else {
    throw ArgumentError("Invalid color string: $colorString");
  }
}

TextStyle convertToTextStyle(Map<String, dynamic> labelStyle) {
  Color color = getColorFromString(labelStyle['color']);
  double fontSize = labelStyle['size']?.toDouble() ??
      14.0; // Default font size 14 if not provided
  FontWeight fontWeight = _parseFontWeight(labelStyle['fontWeight']);
  FontStyle fontStyle = _parseFontStyle(labelStyle['style']);

  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
    fontStyle: fontStyle,
  );
}

FontWeight _parseFontWeight(String fontWeight) {
  if (fontWeight == null) {
    return FontWeight.normal; // Default font weight if not provided
  }
  return FontWeight.bold;
}

FontStyle _parseFontStyle(String fontStyle) {
  if (fontStyle == null) {
    return FontStyle.normal; // Default font style if not provided
  }
  return FontStyle.normal;
}

TextStyle convertToTextStyles(Map json) {
  Color color = getColorFromString(json['color']);
  double size = double.tryParse(json['size'].toString()) ?? 14;
  FontWeight fontWeight = FontWeight.values.firstWhere(
      (e) => e.toString() == 'FontWeight.w${json['fontWeight']}',
      orElse: () => FontWeight.normal);
  FontStyle fontStyle =
      json['style'] == 'italic' ? FontStyle.italic : FontStyle.normal;

  return TextStyle(
    color: color,
    fontSize: size,
    fontWeight: fontWeight,
    fontStyle: fontStyle,
  );
}

AxisLine convertToAxisLine(Map json) {
  Color color = getColorFromString(json['color']);
  double width = double.tryParse(json['width'].toString()) ?? 1;

  return AxisLine(
    color: color,
    width: width,
  );
}
