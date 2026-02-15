import '../digits/khmer_digits.dart';
import 'khmer_calendar_data.dart';
import 'khmer_date_presets.dart';

class KhmerDateFormat {
  final String pattern;
  final bool buddhistEra;
  final bool useKhmerDigits;

  KhmerDateFormat(
    this.pattern, {
    this.buddhistEra = false,
    this.useKhmerDigits = false,
  });

  KhmerDateFormat.shortDate({
    bool buddhistEra = false,
    bool useKhmerDigits = false,
  }) : this(
          KhmerDatePatterns.shortDate,
          buddhistEra: buddhistEra,
          useKhmerDigits: useKhmerDigits,
        );

  KhmerDateFormat.mediumDate({
    bool buddhistEra = false,
    bool useKhmerDigits = false,
  }) : this(
          KhmerDatePatterns.mediumDate,
          buddhistEra: buddhistEra,
          useKhmerDigits: useKhmerDigits,
        );

  KhmerDateFormat.fullDate({
    bool buddhistEra = false,
    bool useKhmerDigits = false,
  }) : this(
          KhmerDatePatterns.fullDate,
          buddhistEra: buddhistEra,
          useKhmerDigits: useKhmerDigits,
        );

  KhmerDateFormat.fullDateTime({
    bool buddhistEra = false,
    bool useKhmerDigits = false,
  }) : this(
          KhmerDatePatterns.fullDateTime,
          buddhistEra: buddhistEra,
          useKhmerDigits: useKhmerDigits,
        );

  String format(DateTime date) {
    var out = pattern;

    final year = buddhistEra ? (date.year + 543) : date.year;
    final month = date.month; // 1..12
    final day = date.day;

    final weekdayIndex = _weekdayToIndex(date.weekday); // Mon..Sun => 0..6
    final weekdayShort = khmerWeekdaysShort[weekdayIndex];
    final weekdayLong = khmerWeekdaysLong[weekdayIndex];

    final monthShort = khmerMonthsShort[month - 1];
    final monthLong = khmerMonthsLong[month - 1];

    final hour24 = date.hour;
    final hour = hour24.toString();
    final hour2 = hour24.toString().padLeft(2, '0');
    final minute2 = date.minute.toString().padLeft(2, '0');
    final second2 = date.second.toString().padLeft(2, '0');
    final ampm = hour24 < 12 ? khmerAm : khmerPm;

    // IMPORTANT: replace longer tokens first to avoid collisions
    out = out.replaceAll('EEEE', weekdayLong);
    out = out.replaceAll('EEE', weekdayShort);

    out = out.replaceAll('MMMM', monthLong);
    out = out.replaceAll('MMM', monthShort);

    out = out.replaceAll('yyyy', year.toString().padLeft(4, '0'));
    out = out.replaceAll('dd', day.toString().padLeft(2, '0'));
    out = out.replaceAll('MM', month.toString().padLeft(2, '0'));

    // Time tokens
    out = out.replaceAll('HH', hour2);
    out = out.replaceAll('H', hour);
    out = out.replaceAll('mm', minute2);
    out = out.replaceAll('ss', second2);
    out = out.replaceAll('a', ampm);

    return useKhmerDigits ? toKhmerDigits(out) : out;
  }

  int _weekdayToIndex(int dartWeekday) {
    // Dart: Mon=1..Sun=7
    return dartWeekday == DateTime.sunday ? 6 : dartWeekday - 1;
  }
}
