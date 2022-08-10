import 'package:intl/intl.dart';

String convertDate(DateTime dateTime) {
  var dt = dateTime;
  var formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
  String formatted = formatter.format(dt); // Save this to DB
  return formatted;
}
