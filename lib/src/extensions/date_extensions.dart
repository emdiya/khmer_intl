import '../date/khmer_date_format.dart';
import '../time/khmer_relative_time.dart';

extension KhmerDateX on DateTime {
  String toKhmerDate({
    String pattern = 'dd MMMM yyyy',
    bool buddhistEra = false,
    bool useKhmerDigits = false,
  }) =>
      KhmerDateFormat(pattern,
              buddhistEra: buddhistEra, useKhmerDigits: useKhmerDigits)
          .format(this);

  String toKhmerRelativeTime({
    DateTime? reference,
    bool useKhmerDigits = false,
  }) =>
      KhmerRelativeTime.format(
        this,
        reference: reference,
        useKhmerDigits: useKhmerDigits,
      );
}
