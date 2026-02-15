import 'package:intl/intl.dart';

import '../digits/khmer_digits.dart';
import 'khmer_compact_number_format.dart';
import 'khmer_percent_format.dart';

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

  factory KhmerNumberFormat.compact({
    bool useKhmerDigits = false,
    int fractionDigits = 1,
  }) {
    final compact = KhmerCompactNumberFormat(
      useKhmerDigits: false,
      fractionDigits: fractionDigits,
    );
    return KhmerNumberFormat._(
      null,
      compact.format,
      useKhmerDigits: useKhmerDigits,
    );
  }

  factory KhmerNumberFormat.percent({
    bool useKhmerDigits = false,
    int fractionDigits = 0,
    String locale = 'en_US',
  }) {
    final percent = KhmerPercentFormat(
      fractionDigits: fractionDigits,
      locale: locale,
      useKhmerDigits: false,
    );
    return KhmerNumberFormat._(
      null,
      percent.format,
      useKhmerDigits: useKhmerDigits,
    );
  }

  factory KhmerNumberFormat.compactCurrency({
    bool useKhmerDigits = false,
    bool khmerStyle = false,
    String symbol = '៛',
    bool symbolOnLeft = true,
    bool spaceBetweenSymbol = true,
    int fractionDigits = 1,
  }) {
    final compactKhmer = KhmerCompactNumberFormat(
      useKhmerDigits: false,
      fractionDigits: fractionDigits,
    );
    final separator = spaceBetweenSymbol ? ' ' : '';
    return KhmerNumberFormat._(
      null,
      (number) {
        final compactValue = khmerStyle
            ? compactKhmer.format(number)
            : _formatEnglishCompact(number, fractionDigits);
        return symbolOnLeft
            ? '$symbol$separator$compactValue'
            : '$compactValue$separator$symbol';
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

  static String _formatEnglishCompact(num value, int fractionDigits) {
    final absValue = value.abs();
    num scaled = value;
    String suffix = '';

    if (absValue >= 1000000000) {
      scaled = value / 1000000000;
      suffix = 'B';
    } else if (absValue >= 1000000) {
      scaled = value / 1000000;
      suffix = 'M';
    } else if (absValue >= 1000) {
      scaled = value / 1000;
      suffix = 'K';
    }

    if (suffix.isEmpty) {
      return scaled.toStringAsFixed(0);
    }

    final fixed = scaled.toStringAsFixed(fractionDigits);
    final trimmed =
        fixed.contains('.') ? fixed.replaceFirst(RegExp(r'\.?0+$'), '') : fixed;
    return '$trimmed$suffix';
  }
}
