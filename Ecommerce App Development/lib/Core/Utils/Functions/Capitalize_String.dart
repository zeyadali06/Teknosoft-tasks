// ignore_for_file: file_names

String capitalizeEachWord(String str) {
  return str.split(' ').map((word) {
    if (word.isEmpty) return word;
    return word[0].toUpperCase() + word.substring(1);
  }).join(' ');
}
