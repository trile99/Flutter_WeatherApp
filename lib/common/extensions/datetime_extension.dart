import 'package:intl/intl.dart';

extension DateTimeX on DateTime {
  String get weekDayName {
    return DateFormat('EEEE').format(this);
  }
}
