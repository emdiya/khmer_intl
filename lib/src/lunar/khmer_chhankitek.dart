import 'package:khmer_lunar_chhankitek/khmer_lunar_chhankitek.dart' as ch;

typedef KhmerChhankitekLunarDay = ch.LunarDay;
typedef KhmerChhankitekLunarDate = ch.KhmerLunarDate;
typedef KhmerChhankitekLunarMonth = ch.LunarMonth;
typedef KhmerChhankitekLunarPhase = ch.LunarPhase;
typedef KhmerChhankitekOptions = ch.KhmerLunarOptions;
typedef KhmerChhankitekNewYear = ch.KhmerNewYear;
typedef KhmerChhankitekNewYearCal = ch.KhmerNewYearCal;

/// Bridge API for `khmer_lunar_chhankitek` without symbol collisions.
class KhmerChhankitek {
  KhmerChhankitek._();

  static int get minSupportedYear => ch.KhmerLunar.minSupportedYear;
  static int get maxSupportedYear => ch.KhmerLunar.maxSupportedYear;

  static KhmerChhankitekLunarDate toKhmerLunarDate(DateTime date) =>
      ch.Chhankitek.toKhmerLunarDateFormat(date);

  static KhmerChhankitekNewYear khmerNewYearByJsYear(int jsYear) =>
      ch.KhmerNewYearCal(jsYear).khmerNewYear;

  static KhmerChhankitekNewYear khmerNewYearByGregorianYear(
    int gregorianYear,
  ) {
    final jsYear = (gregorianYear + 544) - 1182;
    return khmerNewYearByJsYear(jsYear);
  }

  static String formatKhmerGregorianDate(DateTime date) =>
      ch.formatKhmerGregorianDate(date);

  static String formatIsoDate(DateTime date) => ch.formatIsoDate(date);

  static String formatIsoDateTime(DateTime date) => ch.formatIsoDateTime(date);

  static String toKhmerDigits(Object input) => ch.toKhmerDigits(input);

  static KhmerChhankitekLunarDay day(
    DateTime date, {
    bool useKhmerDigits = false,
    String locale = 'km',
  }) {
    return ch.KhmerLunar.day(
      date,
      options: ch.KhmerLunarOptions(
        useKhmerDigits: useKhmerDigits,
        locale: locale,
      ),
    );
  }

  static bool isSilDay(
    DateTime date, {
    bool useKhmerDigits = false,
    String locale = 'km',
  }) {
    return ch.KhmerLunar.isSilDay(
      date,
      options: ch.KhmerLunarOptions(
        useKhmerDigits: useKhmerDigits,
        locale: locale,
      ),
    );
  }

  static bool isKorDay(
    DateTime date, {
    bool useKhmerDigits = false,
    String locale = 'km',
  }) {
    return ch.KhmerLunar.isKorDay(
      date,
      options: ch.KhmerLunarOptions(
        useKhmerDigits: useKhmerDigits,
        locale: locale,
      ),
    );
  }

  static List<KhmerChhankitekLunarDay> month(
    int year,
    int month, {
    bool useKhmerDigits = false,
    String locale = 'km',
  }) {
    return ch.KhmerLunar.month(
      year,
      month,
      options: ch.KhmerLunarOptions(
        useKhmerDigits: useKhmerDigits,
        locale: locale,
      ),
    );
  }

  static List<KhmerChhankitekLunarDay> year(
    int year, {
    bool useKhmerDigits = false,
    String locale = 'km',
  }) {
    return ch.KhmerLunar.year(
      year,
      options: ch.KhmerLunarOptions(
        useKhmerDigits: useKhmerDigits,
        locale: locale,
      ),
    );
  }

  static void clearYearCache() => ch.KhmerLunar.clearYearCache();
}
