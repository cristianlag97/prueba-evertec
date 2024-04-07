part of core.helpers;

String formatterNumber(int number) {
  final formattedNumber = NumberFormat.decimalPattern().format(number);
  return formattedNumber;
}
