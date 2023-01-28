class Date {
  late int _day;
  late int _month;
  late int _year;

  Date(DateTime time) {
    _day = time.day;
    _month = time.month;
    _year = time.year;
  }

  @override
  String toString() {
    return '$_day/$_month/$_year';
  }
}
