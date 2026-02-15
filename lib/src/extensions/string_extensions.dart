import '../digits/khmer_digits.dart' as khmer_digits;

extension KhmerStringX on String {
  String toKhmerDigits() => khmer_digits.toKhmerDigits(this);
  String toLatinDigits() => khmer_digits.toLatinDigits(this);
}
