import 'package:intl/intl.dart';

String formatterNumber(int number) {
  final formattedNumber = NumberFormat.decimalPattern().format(number);
  return formattedNumber;
}
