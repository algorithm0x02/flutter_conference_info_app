import 'package:intl/intl.dart';

extension ToDate on String {
  String strToDate(String str) {
    DateTime date = DateTime.parse(this);
    String result = DateFormat(str).format(date);
    //String result = DateFormat.yMMMd().format(date);
    return result;
  }
}