class Date {
  late int _day;
  late int _month;
  late int _year;

  Date(DateTime time) {
    _day = time.day;
    _month = time.month;
    _year = time.year;
  }

  Date.today() {
    final now = DateTime.now();

    _day = now.day;
    _month = now.month;
    _year = now.year;
  }

  Date.tomorrow() {
    final now = DateTime.now();

    _day = now.day + 1;
    _month = now.month;
    _year = now.year;
  }

  Date.yesteday() {
    final now = DateTime.now();

    _day = now.day - 1;
    _month = now.month;
    _year = now.year;
  }

  Date.fromInt({
    required int year,
    required int month,
    required int day,
  }) {
    _day = day;
    _month = month;
    _year = year;
  }

  int get day => _day;
  int get month => _month;
  int get year => _year;

  DateTime get datetime => DateTime(_year, _month, _day);

  bool isEqual(DateTime date) {
    final sameDay = _day == date.day;
    final sameMonth = _month == date.month;
    final sameYear = _year == date.year;

    return sameDay && sameMonth && sameYear;
  }

  bool isToday() {
    final now = DateTime.now();

    return isEqual(now);
  }

  bool isLeapYear() {
    if (_year % 100 != 0) {
      return _year % 4 == 0;
    } else {
      return _year % 400 == 0;
    }
  }

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

  bool is31Days() {
    if (_month == 2) {
      return false;
    }

    return is30Days() == false ? true : false;
  }

  bool is29Days() {
    return _month == 2 && isLeapYear();
  }

  bool is28Days() {
    return isLeapYear() == false && _month == 2 ? true : false;
  }

  @override
  String toString() {
    return '$_day/$_month/$_year';
  }
}
