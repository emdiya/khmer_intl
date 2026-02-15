import 'package:flutter_test/flutter_test.dart';
import 'package:khmer_intl/khmer_intl.dart';

void main() {
  test('convert digits', () {
    expect(toKhmerDigits('123'), '១២៣');
  });
}
