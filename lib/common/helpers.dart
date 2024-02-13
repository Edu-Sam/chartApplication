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
