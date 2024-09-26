import 'package:intl/intl.dart';

String numberFormat(double value, {decimalDigits = 2}) {
  final formatNumber = NumberFormat.decimalPattern('es');
  formatNumber.minimumFractionDigits = decimalDigits;
  formatNumber.maximumFractionDigits = decimalDigits;
  return formatNumber
      .format(value)
      .replaceAll(',', '*')
      .replaceAll('.', ',')
      .replaceAll('*', '.');
}

double parseFormattedNumber(String formattedNumber) {
  // Eliminar las comas
  String withoutCommas = formattedNumber.replaceAll(',', '');

  // Parsear a double
  try {
    return double.parse(withoutCommas);
  } catch (e) {
    return 0.0; // O puedes lanzar una excepción si prefieres
  }
}
