class DateHelper {
  static DateTime startWeek(DateTime date) {
    int currentWeekday = date.weekday;
    int daysUntilMonday = currentWeekday - 1;
    return date.subtract(Duration(days: daysUntilMonday));
  }

  static DateTime endWeek(DateTime date) {
    return startWeek(date).add(const Duration(days: 6));
  }
}
