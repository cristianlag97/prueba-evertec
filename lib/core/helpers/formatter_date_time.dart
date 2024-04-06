import 'package:intl/intl.dart';

String formatterDateTime(String value) {
  if (value == '') return 'no hay registro';
  DateFormat inputFormat = DateFormat("d/M/yyyy HH:mm");
  DateTime dateTime = inputFormat.parse(value);

  String month = DateFormat("MMMM", "es").format(dateTime);

  String abbreviatedMonth = month.substring(0, 3);

  String formattedDate =
      DateFormat("d ' $abbreviatedMonth' y", "es").format(dateTime);
  return formattedDate;
}
