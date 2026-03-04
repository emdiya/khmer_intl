import '../date/khmer_date_format.dart';
import '../lunar/khmer_chhankitek.dart';
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

  KhmerChhankitekLunarDate toKhmerChhankitekLunarDate() =>
      KhmerChhankitek.toKhmerLunarDate(this);

  KhmerChhankitekLunarDay toKhmerChhankitekLunarDay({
    bool useKhmerDigits = false,
    String locale = 'km',
  }) =>
      KhmerChhankitek.day(
        this,
        useKhmerDigits: useKhmerDigits,
        locale: locale,
      );

  bool isKhmerChhankitekSilDay({
    bool useKhmerDigits = false,
    String locale = 'km',
  }) =>
      KhmerChhankitek.isSilDay(
        this,
        useKhmerDigits: useKhmerDigits,
        locale: locale,
      );

  bool isKhmerChhankitekKorDay({
    bool useKhmerDigits = false,
    String locale = 'km',
  }) =>
      KhmerChhankitek.isKorDay(
        this,
        useKhmerDigits: useKhmerDigits,
        locale: locale,
      );

  String toKhmerChhankitekGregorianDate() =>
      KhmerChhankitek.formatKhmerGregorianDate(this);

  String toKhmerChhankitekIsoDate() => KhmerChhankitek.formatIsoDate(this);

  String toKhmerChhankitekIsoDateTime() =>
      KhmerChhankitek.formatIsoDateTime(this);
}
