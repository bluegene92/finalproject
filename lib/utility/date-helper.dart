class DateHelper {
  static DateTime startWeek(DateTime date) {
    int currentWeekday = date.weekday;
    int daysUntilMonday = currentWeekday - 1;
    return date.subtract(Duration(days: daysUntilMonday));
  }

  static DateTime endWeek(DateTime date) {
    return startWeek(date).add(const Duration(days: 6));
  }

  static bool isToday(DateTime dateTime) {
    DateTime now = DateTime.now();
    DateTime today = DateTime(now.year, now.month, now.day);

    return dateTime.year == today.year &&
        dateTime.month == today.month &&
        dateTime.day == today.day;
  }

  static bool isYesterday(DateTime dateTime) {
    DateTime now = DateTime.now();
    DateTime yesterday = DateTime(now.year, now.month, now.day - 1);

    return dateTime.year == yesterday.year &&
        dateTime.month == yesterday.month &&
        dateTime.day == yesterday.day;
  }
}
