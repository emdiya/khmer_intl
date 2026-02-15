import '../digits/khmer_digits.dart';

class KhmerCompactNumberFormat {
  final bool useKhmerDigits;
  final int fractionDigits;

  const KhmerCompactNumberFormat({
    this.useKhmerDigits = false,
    this.fractionDigits = 1,
  });

  String format(num value) {
    final absValue = value.abs();

    num scaled = value;
    String suffix = '';

    if (absValue >= 1000000000) {
      scaled = value / 1000000000;
      suffix = 'ពាន់លាន';
    } else if (absValue >= 1000000) {
      scaled = value / 1000000;
      suffix = 'លាន';
    } else if (absValue >= 1000) {
      scaled = value / 1000;
      suffix = 'ពាន់';
    }

    final decimals = suffix.isEmpty ? 0 : fractionDigits;
    final scaledText = _trim(scaled.toStringAsFixed(decimals));
    final output = '$scaledText$suffix';

    return useKhmerDigits ? toKhmerDigits(output) : output;
  }

  String _trim(String input) {
    if (!input.contains('.')) return input;
    return input.replaceFirst(RegExp(r'\\.?0+$'), '');
  }
}
