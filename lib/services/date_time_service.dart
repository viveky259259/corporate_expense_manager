import 'package:intl/intl.dart';

class DateTimeService {
  static DateTime fromString(String string) {
    if (string == null) return null;
    return DateTime.parse(string);
  }

  static String dateInString(DateTime dateTime) {
    if (dateTime == null) return null;
    return DateFormat('HH:mm MMM dd yyyy').format(dateTime).toString();
  }
}
