import 'package:intl/intl.dart';

class DateUtils {
  static String formatDate(DateTime date) {
    return DateFormat('dd MMM yyyy').format(date);
  }
  
  static String formatDateTime(DateTime dateTime) {
    return DateFormat('dd MMM yyyy, hh:mm a').format(dateTime);
  }
  
  static String formatTime(DateTime time) {
    return DateFormat('hh:mm a').format(time);
  }
  
  static String formatMonth(DateTime date) {
    return DateFormat('MMMM yyyy').format(date);
  }
  
  static String formatYear(DateTime date) {
    return DateFormat('yyyy').format(date);
  }
  
  static bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }
  
  static bool isSameMonth(DateTime date1, DateTime date2) {
    return date1.year == date2.year && date1.month == date2.month;
  }
  
  static bool isSameYear(DateTime date1, DateTime date2) {
    return date1.year == date2.year;
  }
  
  static DateTime getFirstDayOfMonth(DateTime date) {
    return DateTime(date.year, date.month, 1);
  }
  
  static DateTime getLastDayOfMonth(DateTime date) {
    return DateTime(date.year, date.month + 1, 0);
  }
  
  static DateTime getFirstDayOfYear(DateTime date) {
    return DateTime(date.year, 1, 1);
  }
  
  static DateTime getLastDayOfYear(DateTime date) {
    return DateTime(date.year, 12, 31);
  }
  
  static DateTime getPreviousMonth(DateTime date) {
    if (date.month == 1) {
      return DateTime(date.year - 1, 12);
    }
    return DateTime(date.year, date.month - 1);
  }
  
  static DateTime getNextMonth(DateTime date) {
    if (date.month == 12) {
      return DateTime(date.year + 1, 1);
    }
    return DateTime(date.year, date.month + 1);
  }
  
  static DateTime getPreviousYear(DateTime date) {
    return DateTime(date.year - 1, date.month, date.day);
  }
  
  static DateTime getNextYear(DateTime date) {
    return DateTime(date.year + 1, date.month, date.day);
  }
}
