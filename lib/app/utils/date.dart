import 'package:intl/intl.dart';

String dateFormat(String inputDate) {
  DateTime date = DateTime.parse(inputDate);
  DateFormat dateFormat = DateFormat('d MMM y', 'es');
  return dateFormat.format(date).replaceAll('.', '');
}

String dateFormat1(String inputDate) {
  DateTime date = DateTime.parse(inputDate);
  DateFormat dateFormat = DateFormat('d MMMM y', 'es');
  return dateFormat.format(date).replaceAll('.', '');
}

String dateFormat2(String inputDate) {
  DateTime date = DateTime.parse(inputDate);
  DateFormat dateFormat = DateFormat('d MMMM y, hh:mm', 'es');
  return dateFormat.format(date).replaceAll('.', '');
}

String dateFormat3(DateTime date) {
  DateFormat dateFormat = DateFormat('hh:mm a', 'es');
  return dateFormat.format(date).replaceAll('.', '');
}
