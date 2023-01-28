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

  @override
  String toString() {
    return '$_day/$_month/$_year';
  }
}
