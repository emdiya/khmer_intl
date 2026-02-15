import '../number/khmer_number_format.dart';
import '../number/khmer_compact_number_format.dart';
import '../number/khmer_percent_format.dart';

extension KhmerNumX on num {
  String toKhmerCurrency({
    bool useKhmerDigits = false,
    String locale = 'en_US',
  }) =>
      KhmerNumberFormat.currencyKHR(
        useKhmerDigits: useKhmerDigits,
        locale: locale,
      ).format(this);

  String toKhmerCompact({
    bool useKhmerDigits = false,
    int fractionDigits = 1,
  }) =>
      KhmerCompactNumberFormat(
        useKhmerDigits: useKhmerDigits,
        fractionDigits: fractionDigits,
      ).format(this);

  String toKhmerPercent({
    bool useKhmerDigits = false,
    int fractionDigits = 0,
    String locale = 'en_US',
  }) =>
      KhmerPercentFormat(
        fractionDigits: fractionDigits,
        locale: locale,
        useKhmerDigits: useKhmerDigits,
      ).format(this);

  String toKhmerCompactCurrency({
    bool useKhmerDigits = false,
    bool khmerStyle = false,
    String symbol = '៛',
    bool symbolOnLeft = true,
    bool spaceBetweenSymbol = true,
    int fractionDigits = 1,
  }) =>
      KhmerNumberFormat.compactCurrency(
        useKhmerDigits: useKhmerDigits,
        khmerStyle: khmerStyle,
        symbol: symbol,
        symbolOnLeft: symbolOnLeft,
        spaceBetweenSymbol: spaceBetweenSymbol,
        fractionDigits: fractionDigits,
      ).format(this);
}
