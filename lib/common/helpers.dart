import 'dart:ui';

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

Color getColorFromRGBString(String rgbString) {
  String cleanString = rgbString.replaceAll('rgb(', '').replaceAll(')', '');

  List<String> values = cleanString.split(',');

  int red = int.parse(values[0].trim());
  int green = int.parse(values[1].trim());
  int blue = int.parse(values[2].trim());

  return Color.fromRGBO(red, green, blue, 1.0);
}
