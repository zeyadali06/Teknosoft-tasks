// ignore_for_file: file_names

List<Map<String, dynamic>> dynamicToAddress(dynamic data) {
  List<dynamic> dataList = data as List<dynamic>;

  return dataList.map((item) {
    var map = item as Map<String, dynamic>;
    return {
      'uid': map['uid'],
      'phone': map['phone'],
      'country': map['country'],
      'street': map['street'],
      'buildNumber': map['buildNumber'],
      'city': map['city'],
      'district': map['district'],
    };
  }).toList();
}
