import 'package:intl/intl.dart';

import '../digits/khmer_digits.dart';

class KhmerPercentFormat {
  final NumberFormat _format;
  final bool useKhmerDigits;

  KhmerPercentFormat({
    int fractionDigits = 0,
    String locale = 'en_US',
    this.useKhmerDigits = false,
  }) : _format = NumberFormat.percentPattern(locale)
          ..minimumFractionDigits = fractionDigits
          ..maximumFractionDigits = fractionDigits;

  String format(num value) {
    final output = _format.format(value);
    return useKhmerDigits ? toKhmerDigits(output) : output;
  }
}
