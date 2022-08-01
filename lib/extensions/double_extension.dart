import 'package:intl/intl.dart';

extension DoubleExtension on double {
  String toCurrencyFormat() {
    final numberFormat = NumberFormat("#,##0.00");
    return 'Php ${numberFormat.format(this)}';
  }
}
