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

  @override
  String toString() {
    return '$_day/$_month/$_year';
  }
}
