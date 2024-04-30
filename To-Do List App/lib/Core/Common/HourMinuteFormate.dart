// ignore_for_file: file_names

String hourMinuteFormate(DateTime datetime) {
  return "${datetime.hour >= 10 ? datetime.hour : "0${datetime.hour}"}:${datetime.minute >= 10 ? datetime.minute : "0${datetime.minute}"}";
}
