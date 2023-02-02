import 'package:intl/intl.dart';

class DateException implements Exception {
  String error;
  DateException(this.error);
}

/// A date that does not use time.
///
/// The [Date] class is used to only work with dates
/// without considering hours, methods related to hours
/// are not available in this class.
///
/// If you want to work only with time, consider using
/// the [Time] class.
///
/// If you want to work with both [Date] and [Time],
/// consider using the [DateAndTime] class.
class Date {
  late int _day;
  late int _month;
  late int _year;

  String? _format;

  Date(DateTime time) {
    _day = time.day;
    _month = time.month;
    _year = time.year;
    _format = "yyyy-MM-dd";
  }

  Date.today() {
    final now = DateTime.now();

    _day = now.day;
    _month = now.month;
    _year = now.year;
    _format = "yyyy-MM-dd";
  }

  Date.tomorrow() {
    final now = DateTime.now();

    _day = now.day + 1;
    _month = now.month;
    _year = now.year;
    _format = "yyyy-MM-dd";
  }

  Date.yesteday() {
    final now = DateTime.now();

    _day = now.day - 1;
    _month = now.month;
    _year = now.year;
    _format = "yyyy-MM-dd";
  }

  Date.fromInt({
    required int year,
    required int month,
    required int day,
  }) {
    _day = day;
    _month = month;
    _year = year;
    _format = "yyyy-MM-dd";
  }

  /// The current day stored by the class
  int get day => _day;

  /// The current month stored by the class
  int get month => _month;

  /// The current year stored by the class
  int get year => _year;

  /// The equivalent DateTime, used for compatibility reasons
  DateTime get datetime => DateTime(_year, _month, _day);

  @override
  String toString() {
    final DateFormat formatter = DateFormat(_format);
    final String formatted = formatter.format(DateTime(_year, _month, _day));
    return formatted;
  }

  void setFormat(String format) => _format = format;

  /// Checks wether the current class date is equal to a DateTime
  ///
  /// Returns `true` if the current date stored by the class
  /// is equal to the DateTime provided.
  ///
  /// ```dart
  /// final date = Date(DateTime(2012, 1, 1));
  ///
  /// // Returns false
  /// date.isEqual(DateTime(2022, 5, 20));
  ///
  /// // Returns true
  /// date.isEqual(DateTime(2012, 1, 1));
  /// ```
  bool isEqual(DateTime date) {
    final sameDay = _day == date.day;
    final sameMonth = _month == date.month;
    final sameYear = _year == date.year;

    return sameDay && sameMonth && sameYear;
  }

  /// Returns `true` if the current class date is today.
  ///
  /// Uses the method [Date.isEqual] to check wether the
  /// current class date is today.
  ///
  /// ```dart
  /// final today = Date.today();
  /// final tomorrow = Date.tomorrow();
  ///
  /// // Returns true
  /// today.isToday();
  ///
  /// // Returns false
  /// tomorrow.isToday();
  /// ```
  bool isToday() {
    final now = DateTime.now();

    return isEqual(now);
  }

  /// Returns `true` if the current class year is a leap year.
  ///
  /// ```dart
  /// final endOfTheWorld = Date(DateTime(2012, 12, 21));
  /// final currentYear = Date(DateTime(2023, 1, 1));
  ///
  /// // Returns true
  /// endOfTheWorld.isLeapYear();
  ///
  /// // Returns false
  /// currentYear.isLeapYear();
  /// ```
  bool isLeapYear() {
    if (_year % 100 != 0) {
      return _year % 4 == 0;
    } else {
      return _year % 400 == 0;
    }
  }

  /// Returns `true` if the current class month has 30 days.
  ///
  /// Always returns `false` if the current month is February.
  bool is30Days() {
    if (_month == 2) {
      return false;
    }

    switch (_month) {
      case 4:
      case 6:
      case 9:
      case 11:
        return true;
      default:
        return false;
    }
  }

  /// Returns `true` if the current class month has 31 days.
  ///
  /// Always returns `false` if the current month is February.
  bool is31Days() {
    if (_month == 2) {
      return false;
    }

    return is30Days() == false ? true : false;
  }

  /// Returns `true` if the current class month has 29 days.
  ///
  /// Only returns `true` if the current class month is February
  /// and the current class year is a leap year.
  bool is29Days() {
    return _month == 2 && isLeapYear();
  }

  bool is28Days() {
    return isLeapYear() == false && _month == 2 ? true : false;
  }

  void _incrementYear() {
    _year += 1;
  }

  void _incrementMonth() {
    if (_month == 12) {
      _incrementYear();
      _month = 1;
    } else {
      _month += 1;
    }
  }

  void _incrementDay() {
    if (_day < 0) {
      throw Exception("Day cannot be negative");
    }

    if (_day == 28 && is28Days()) {
      _incrementMonth();
      _day = 1;
    } else if (_day == 29 && is29Days()) {
      _incrementMonth();
      _day = 1;
    } else if (_day == 30 && is30Days()) {
      _incrementMonth();
      _day = 1;
    } else if (_day == 31 && is31Days()) {
      _incrementMonth();
      _day = 1;
    } else {
      _day += 1;
    }
  }

  void addDays(int amount) {
    if (amount < 1) throw DateException("Amount should be greater than 0.");

    for (var i = 0; i < amount; i++) {
      _incrementDay();
    }
  }

  void addMonths(int amount) {
    if (amount < 1) throw DateException("Amount should be greater than 0.");

    int targetYear = _year;
    int targetMonth = _month;

    // If months exceed 12, take the modulus of this value
    if (_month + amount > 12) {
      targetMonth = (_month + amount) % 12;
      targetYear = _year + (amount ~/ 12);
    } else {
      targetMonth = _month + amount;
    }

    final targetDate = DateTime(targetYear, targetMonth, _day);

    while (!isEqual(targetDate)) {
      _incrementDay();
      print(this.toString());
    }
  }

  void addYears(int amount) {
    if (amount < 1) throw DateException("Amount should be greater than 0.");

    final targetYear = _year + amount;
    final targetDate = DateTime(targetYear, _month, _day);

    while (!isEqual(targetDate)) {
      _incrementDay();
      print(this.toString());
    }
  }
}
