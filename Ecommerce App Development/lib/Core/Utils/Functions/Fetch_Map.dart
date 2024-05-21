// ignore_for_file: file_names

Map<String, int>? convertToMap(dynamic res) {
  if (res is Map) {
    try {
      Map<String, int> resultMap = {};

      res.forEach((k, v) {
        String key = k.toString();
        int value = int.parse(v.toString());
        resultMap[key] = value;
      });

      return resultMap;
    } catch (_) {}
  }
  return null;
}
