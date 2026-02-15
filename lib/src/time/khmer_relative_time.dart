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

    if (seconds < 45) {
      return past ? 'មុននេះបន្តិច' : 'ឆាប់ៗនេះ';
    }

    final valueUnit = _pickUnit(seconds);
    final valueText = useKhmerDigits
        ? toKhmerDigits(valueUnit.value.toString())
        : valueUnit.value.toString();

    if (past) {
      return '$valueText ${valueUnit.unit}មុន';
    }
    return 'ក្នុង $valueText ${valueUnit.unit}';
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
