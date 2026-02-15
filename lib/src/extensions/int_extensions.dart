import '../digits/khmer_digits.dart' as khmer_digits;
import '../number/khmer_number_words.dart';

extension KhmerIntX on int {
  String toKhmerDigits() => khmer_digits.toKhmerDigits(toString());
  String toKhmerWords() => numberToKhmerWords(this);
}
