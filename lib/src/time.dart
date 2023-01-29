class Time {
  late int _hours;
  late int _minutes;
  late int _seconds;
  int? _millisecond;

  Time(DateTime date) {
    _hours = date.hour;
    _minutes = date.minute;
    _seconds = date.second;
    _millisecond = date.microsecond;
  }

  Time.now() {
    final now = DateTime.now();

    _hours = now.hour;
    _minutes = now.minute;
    _seconds = now.second;
    _millisecond = now.microsecond;
  }
}
