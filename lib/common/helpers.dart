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

  if (maxMap == null) return [];

  return maxMap.keys.toList();
}

bool isNumeric(String str) {
  if (str == null) {
    return false;
  }
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
