const _latinToKhmer = {
  '0': '០',
  '1': '១',
  '2': '២',
  '3': '៣',
  '4': '៤',
  '5': '៥',
  '6': '៦',
  '7': '៧',
  '8': '៨',
  '9': '៩',
};

const _khmerToLatin = {
  '០': '0',
  '១': '1',
  '២': '2',
  '៣': '3',
  '៤': '4',
  '៥': '5',
  '៦': '6',
  '៧': '7',
  '៨': '8',
  '៩': '9',
};

String toKhmerDigits(String input) {
  final buffer = StringBuffer();
  for (final ch in input.split('')) {
    buffer.write(_latinToKhmer[ch] ?? ch);
  }
  return buffer.toString();
}

String toLatinDigits(String input) {
  final buffer = StringBuffer();
  for (final ch in input.split('')) {
    buffer.write(_khmerToLatin[ch] ?? ch);
  }
  return buffer.toString();
}
