import '../digits/khmer_digits.dart' as khmer_digits;

extension KhmerIntX on int {
  String toKhmerDigits() => khmer_digits.toKhmerDigits(toString());
}
