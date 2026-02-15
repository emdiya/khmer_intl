import '../digits/khmer_digits.dart';

const _khmerDigitsWords = <String>[
  'សូន្យ',
  'មួយ',
  'ពីរ',
  'បី',
  'បួន',
  'ប្រាំ',
  'ប្រាំមួយ',
  'ប្រាំពីរ',
  'ប្រាំបី',
  'ប្រាំបួន',
];

String numberToKhmerWords(int number) {
  if (number == 0) return _khmerDigitsWords[0];
  if (number < 0) return 'ដក${numberToKhmerWords(-number)}';

  final parts = <String>[];
  var n = number;

  if (n >= 1000000) {
    parts.add('${_underOneThousand(n ~/ 1000000)}លាន');
    n %= 1000000;
  }

  if (n >= 1000) {
    final thousands = n ~/ 1000;
    if (thousands == 1) {
      parts.add('មួយពាន់');
    } else {
      parts.add('${_underOneThousand(thousands)}ពាន់');
    }
    n %= 1000;
  }

  if (n > 0) {
    parts.add(_underOneThousand(n));
  }

  return parts.join();
}

String numberToKhmerWordsDigits(int number) {
  return toKhmerDigits(numberToKhmerWords(number));
}

String _underOneThousand(int number) {
  assert(number >= 0 && number < 1000);

  if (number == 0) return '';

  final parts = <String>[];
  var n = number;

  if (n >= 100) {
    parts.add('${_khmerDigitsWords[n ~/ 100]}រយ');
    n %= 100;
  }

  if (n >= 20) {
    final tens = n ~/ 10;
    final unit = n % 10;

    if (tens == 2) {
      parts.add(unit == 0 ? 'ម្ភៃ' : 'ម្ភៃ${_khmerDigitsWords[unit]}');
    } else if (tens == 3) {
      parts.add(unit == 0 ? 'សាមសិប' : 'សាមសិប${_khmerDigitsWords[unit]}');
    } else if (tens == 4) {
      parts.add(unit == 0 ? 'សែសិប' : 'សែសិប${_khmerDigitsWords[unit]}');
    } else if (tens == 5) {
      parts.add(unit == 0 ? 'ហាសិប' : 'ហាសិប${_khmerDigitsWords[unit]}');
    } else if (tens == 6) {
      parts.add(unit == 0 ? 'ហុកសិប' : 'ហុកសិប${_khmerDigitsWords[unit]}');
    } else if (tens == 7) {
      parts.add(unit == 0 ? 'ចិតសិប' : 'ចិតសិប${_khmerDigitsWords[unit]}');
    } else if (tens == 8) {
      parts.add(unit == 0 ? 'ប៉ែតសិប' : 'ប៉ែតសិប${_khmerDigitsWords[unit]}');
    } else if (tens == 9) {
      parts.add(unit == 0 ? 'កៅសិប' : 'កៅសិប${_khmerDigitsWords[unit]}');
    }
  } else if (n >= 10) {
    final unit = n % 10;
    if (n == 10) {
      parts.add('ដប់');
    } else {
      parts.add('ដប់${_khmerDigitsWords[unit]}');
    }
  } else {
    parts.add(_khmerDigitsWords[n]);
  }

  return parts.join();
}
