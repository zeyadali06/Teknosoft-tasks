// ignore_for_file: file_names

List<int>? convertToList(dynamic res) {
  if (res != null && res is List) {
    try {
      return List<int>.from(res.map((item) => int.parse(item.toString())));
    } catch (_) {}
  }
  return null;
}
