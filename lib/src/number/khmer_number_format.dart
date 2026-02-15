import 'package:intl/intl.dart';

import '../digits/khmer_digits.dart';

class KhmerNumberFormat {
  final NumberFormat? _decimalFormat;
  final String Function(num)? _customFormatter;
  final bool useKhmerDigits;

  KhmerNumberFormat._(
    this._decimalFormat,
    this._customFormatter, {
    required this.useKhmerDigits,
  });

  factory KhmerNumberFormat.decimal({
    bool useKhmerDigits = false,
    String locale = 'en_US',
  }) {
    return KhmerNumberFormat._(
      NumberFormat.decimalPattern(locale),
      null,
      useKhmerDigits: useKhmerDigits,
    );
  }

  factory KhmerNumberFormat.currencyKHR({
    bool useKhmerDigits = false,
    String symbol = '៛',
    bool symbolOnLeft = true,
    bool spaceBetweenSymbol = false,
    int fractionDigits = 0, // KHR usually no decimals
    String locale = 'en_US',
  }) {
    // build pattern like "#,##0" or "#,##0.00"
    final pattern =
        fractionDigits <= 0 ? '#,##0' : '#,##0.${'0' * fractionDigits}';

    final base = NumberFormat(pattern, locale);
    return KhmerNumberFormat._(
      null,
      (number) {
        final value = base.format(number);
        final separator = spaceBetweenSymbol ? ' ' : '';
        return symbolOnLeft
            ? '$symbol$separator$value'
            : '$value$separator$symbol';
      },
      useKhmerDigits: useKhmerDigits,
    );
  }

  String format(num value) {
    final customFormatter = _customFormatter;
    final s = customFormatter != null
        ? customFormatter(value)
        : _decimalFormat!.format(value);
    return useKhmerDigits ? toKhmerDigits(s) : s;
  }
}
