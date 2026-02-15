import '../digits/khmer_digits.dart';

class KhmerRelativeTime {
  const KhmerRelativeTime._();

  static String format(
    DateTime target, {
    DateTime? reference,
    bool useKhmerDigits = false,
  }) {
    final now = reference ?? DateTime.now();
    final diff = target.difference(now);
    final past = diff.isNegative;
    final seconds = diff.inSeconds.abs();
    final dayDiff = _calendarDayDiff(target, now);

    if (seconds < 45) {
      return 'ឥឡូវនេះ';
    }

    if (past && dayDiff == 1) {
      return 'ម្សិលមិញ';
    }

    if (past && dayDiff >= 2) {
      final daysText = _digits(dayDiff, useKhmerDigits);
      return 'មុន $daysText ថ្ងៃ';
    }

    final valueUnit = _pickUnit(seconds);
    final valueText = _digits(valueUnit.value, useKhmerDigits);

    if (past) {
      return '$valueText ${valueUnit.unit}មុន';
    }
    return 'ក្នុង $valueText ${valueUnit.unit}';
  }

  static int _calendarDayDiff(DateTime target, DateTime reference) {
    final a = DateTime(reference.year, reference.month, reference.day);
    final b = DateTime(target.year, target.month, target.day);
    return a.difference(b).inDays;
  }

  static String _digits(int value, bool useKhmerDigits) {
    final text = value.toString();
    return useKhmerDigits ? toKhmerDigits(text) : text;
  }

  static _ValueUnit _pickUnit(int seconds) {
    if (seconds < 3600) {
      return _ValueUnit(seconds ~/ 60, 'នាទី');
    }
    if (seconds < 86400) {
      return _ValueUnit(seconds ~/ 3600, 'ម៉ោង');
    }
    if (seconds < 2592000) {
      return _ValueUnit(seconds ~/ 86400, 'ថ្ងៃ');
    }
    if (seconds < 31536000) {
      return _ValueUnit(seconds ~/ 2592000, 'ខែ');
    }
    return _ValueUnit(seconds ~/ 31536000, 'ឆ្នាំ');
  }
}

class _ValueUnit {
  final int value;
  final String unit;

  const _ValueUnit(this.value, this.unit);
}
