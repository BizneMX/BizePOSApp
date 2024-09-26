import 'package:intl/intl.dart';

String formatDateTime(DateTime dateTime) {
  final DateFormat formatter = DateFormat('dd MMMM yy', 'es_ES');
  return formatter.format(dateTime);
}

String formatDateTime1(DateTime dateTime) {
  final DateFormat formatter = DateFormat('dd MMM yy', 'es_ES');
  return formatter.format(dateTime);
}

String formatMoney(double amount,
    {String locale = 'en_US', String symbol = '\$'}) {
  final format = NumberFormat.currency(locale: locale, symbol: symbol);
  return format.format(amount);
}
