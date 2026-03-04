# khmer_intl

Khmer (`km`) internationalization helpers for Dart and Flutter.

`khmer_intl` gives you Khmer-friendly formatting utilities for digits, numbers, currency, dates, relative time, plural selection, and Khmer lunar support via [`khmer_lunar_chhankitek: ^1.0.0`](https://pub.dev/packages/khmer_lunar_chhankitek/versions/1.0.0).

## Preview

<p align="center">
  <img src="example/assets/preview_1.png" alt="Preview 1" width="48%" />
  <img src="example/assets/preview_2.png" alt="Preview 2" width="48%" />
</p>

## Features

- Latin digit -> Khmer digit conversion (`123` -> `១២៣`)
- Khmer digit -> Latin digit conversion
- Number formatting and KHR currency formatting (`៛`)
- Compact number formatting (e.g. `1.3លាន`)
- Compact currency formatting (e.g. `៛ 1.2M`, `៛ ១.២លាន`)
- Percent formatting
- Khmer date formatting with month/weekday names
- Buddhist Era year option (`AD + 543`)
- Date preset constructors (`shortDate`, `mediumDate`, `fullDate`, `fullDateTime`, `dateTime`, `time`)
- Khmer relative time (e.g. `២ ម៉ោងមុន`)
- Simple plural helper
- Structured plural helper with templates (`KhmerPlural.of`)
- Chhankitek lunar integration via `khmer_lunar_chhankitek`
- Number-to-Khmer words conversion (`1250` -> `មួយពាន់ពីររយហាសិប`)
- Extension methods for `int`, `num`, `String`, and `DateTime`

## Installation

```yaml
dependencies:
  khmer_intl: ^0.1.1
```

`khmer_lunar_chhankitek` is already integrated as a dependency of `khmer_intl`, so users can install only `khmer_intl` and use lunar APIs through `KhmerChhankitek`.

Then run:

```bash
dart pub get
```

or (Flutter):

```bash
flutter pub get
```

## Quick Start

```dart
import 'package:khmer_intl/khmer_intl.dart';
```

### Digits

```dart
toKhmerDigits('1234567890');
// ១២៣៤៥៦៧៨៩០

'123'.toKhmerDigits();
// ១២៣

'១២៣'.toLatinDigits();
// 123
```

### Number and Currency

```dart
2500.toKhmerCurrency(useKhmerDigits: true);
// ៛២,៥០០

1250000.toKhmerCompact(useKhmerDigits: true);
// ១.៣លាន

0.275.toKhmerPercent(useKhmerDigits: true, fractionDigits: 1);
// ២៧.៥%

KhmerNumberFormat.compactCurrency().format(1200000);
// ៛ 1.2M

KhmerNumberFormat.compactCurrency(
  khmerStyle: true,
  useKhmerDigits: true,
).format(1200000);
// ៛ ១.២លាន
```

### Date Formatting

```dart
final date = DateTime(2026, 4, 14);

KhmerDateFormat('EEE dd MMMM yyyy', buddhistEra: true, useKhmerDigits: true)
    .format(date);
// អង្គារ ១៤ ខែមេសា ២៥៦៩

KhmerDateFormat.fullDate(buddhistEra: true, useKhmerDigits: true).format(date);
KhmerDateFormat.fullDateTime(useKhmerDigits: true).format(DateTime.now());
KhmerDateFormat.dateTime(useKhmerDigits: true).format(DateTime.now());
KhmerDateFormat.time(useKhmerDigits: true).format(DateTime.now());
```

Khmer date (Chhankitek):

```dart
final date = DateTime(2026, 4, 16);
final khmerDate = KhmerChhankitek.formatKhmerGregorianDate(date);
final lunarDate = KhmerChhankitek.toKhmerLunarDate(date);

print(khmerDate); // ថ្ងៃទី១៦ ខែមេសា ឆ្នាំ២០២៦
print(lunarDate.toString());
```

### Relative Time

```dart
final now = DateTime.now();
final past = now.subtract(const Duration(hours: 2));

past.toKhmerRelativeTime(reference: now, useKhmerDigits: true);
// ២ ម៉ោងមុន

KhmerRelativeTime.format(now, reference: now);
// ឥឡូវនេះ

KhmerRelativeTime.format(now.subtract(const Duration(days: 1)), reference: now);
// ម្សិលមិញ

KhmerRelativeTime.format(now.subtract(const Duration(days: 5)), reference: now);
// មុន 5 ថ្ងៃ
```

### Plural Helper

```dart
khmerPlural(
  2,
  one: 'មានទំនិញ 1 មុខ',
  other: 'មានទំនិញ 2 មុខ',
);

KhmerPlural.of(
  count: 2,
  one: '{count} ឯកតា',
  other: '{count} ឯកតា',
);
// 2 ឯកតា
```

### Number to Khmer Words

```dart
numberToKhmerWords(1250);
// មួយពាន់ពីររយហាសិប

1250.toKhmerWords();
// មួយពាន់ពីររយហាសិប
```

### Chhankitek Lunar Date (Integrated)

```dart
final date = DateTime(2026, 4, 16);

final lunarDate = KhmerChhankitek.toKhmerLunarDate(date);
final lunarDay = KhmerChhankitek.day(date);
final monthDays = KhmerChhankitek.month(date.year, date.month);

print(lunarDate.toString());
print(KhmerChhankitek.formatKhmerGregorianDate(date));
print('Uposatha: ${lunarDay.isUposatha}');
print('Days this month: ${monthDays.length}');

final isSil = KhmerChhankitek.isSilDay(date);
final isKor = KhmerChhankitek.isKorDay(date);

print('ថ្ងៃសីល: $isSil');
print('ថ្ងៃកោរ: $isKor');
print(
  '${KhmerChhankitek.formatKhmerGregorianDate(date)} ជា'
  '${isSil ? 'ថ្ងៃសីល' : (isKor ? 'ថ្ងៃកោរ' : 'ថ្ងៃធម្មតា')}',
);
```

Demo output:

```text
ថ្ងៃព្រហស្បតិ៍ ១៤រោច ខែចេត្រ ឆ្នាំមមីរ អដ្ឋស័ក ព.ស.២៥៦៩
ថ្ងៃទី១៦ ខែមេសា ឆ្នាំ២០២៦
Uposatha: false
Days this month: 30
ថ្ងៃសីល: true
ថ្ងៃកោរ: false
ថ្ងៃទី១៦ ខែមេសា ឆ្នាំ២០២៦ ជាថ្ងៃសីល
```

Full source example:

```dart
import 'package:khmer_intl/khmer_intl.dart';

void main() {
  // Part 1: Today
  final now = DateTime.now();
  final today = KhmerChhankitek.day(now);
  final todayMonthDays = KhmerChhankitek.month(
    today.date.year,
    today.date.month,
  );
  final todayKhmerDate = KhmerChhankitek.toKhmerLunarDate(now);

  print('=== Today ===');
  print(todayKhmerDate.toString());
  print(KhmerChhankitek.formatKhmerGregorianDate(now));
  print('Uposatha: ${today.isUposatha}');
  print('Days this month: ${todayMonthDays.length}');
  final todayIsSil = KhmerChhankitek.isSilDay(now);
  final todayIsKor = KhmerChhankitek.isKorDay(now);
  print('ថ្ងៃសីល: $todayIsSil');
  print('ថ្ងៃកោរ: $todayIsKor');
  print(
    '${KhmerChhankitek.formatKhmerGregorianDate(now)} ជា'
    '${todayIsSil ? 'ថ្ងៃសីល' : (todayIsKor ? 'ថ្ងៃកោរ' : 'ថ្ងៃធម្មតា')}',
  );

  // Part 2: Specific day
  final specificDate = DateTime(2026, 5, 31);
  final specificDay = KhmerChhankitek.day(specificDate);
  final specificMonthDays = KhmerChhankitek.month(
    specificDay.date.year,
    specificDay.date.month,
  );
  final specificKhmerDate = KhmerChhankitek.toKhmerLunarDate(specificDate);

  print('=== Specific Day (2026-05-31) ===');
  print(specificKhmerDate.toString());
  print(KhmerChhankitek.formatKhmerGregorianDate(specificDate));
  print('Uposatha: ${specificDay.isUposatha}');
  print('Days this month: ${specificMonthDays.length}');
  final specificIsSil = KhmerChhankitek.isSilDay(specificDate);
  final specificIsKor = KhmerChhankitek.isKorDay(specificDate);
  print('ថ្ងៃសីល: $specificIsSil');
  print('ថ្ងៃកោរ: $specificIsKor');
  print(
    '${KhmerChhankitek.formatKhmerGregorianDate(specificDate)} ជា'
    '${specificIsSil ? 'ថ្ងៃសីល' : (specificIsKor ? 'ថ្ងៃកោរ' : 'ថ្ងៃធម្មតា')}',
  );
}
```

Khmer New Year helper:

```dart
final ny = KhmerChhankitek.khmerNewYearByGregorianYear(2026);
print('hour: ${ny.timeOfNewYear.hour}');
print('minute: ${ny.timeOfNewYear.minute}');
print('dayLerngSak: ${ny.dayLerngSak}');
```

Demo output:

```text
hour: 10
minute: 48
dayLerngSak: 3
```

Formatting helpers:

```dart
KhmerChhankitek.toKhmerDigits(123); // ១២៣
KhmerChhankitek.formatKhmerGregorianDate(date);
KhmerChhankitek.formatIsoDate(date); // 2026-04-16
KhmerChhankitek.formatIsoDateTime(date); // 2026-04-16 00:00:00
```

### Lunar API Comparison

Use `KhmerChhankitek` when you need Khmer lunar engine features:

- Source: `khmer_lunar_chhankitek` integration
- Best for: `day/month/year`, `isSilDay/isKorDay`, Khmer New Year, Khmer date formatting helpers
- Range: `1900..2100` for day/year APIs
- Accuracy: engine-backed (recommended for production lunar calculations)

```dart
final date = DateTime(2026, 4, 16);
final day = KhmerChhankitek.day(date);
final isSil = KhmerChhankitek.isSilDay(date);
final ny = KhmerChhankitek.khmerNewYearByGregorianYear(2026);
```

## Core APIs

### Top-level functions

- `toKhmerDigits(String input)`
- `toLatinDigits(String input)`
- `khmerPlural(num count, {required String one, required String other})`

### Formatters

- `KhmerNumberFormat.decimal(...)`
- `KhmerNumberFormat.currencyKHR(...)`
- `KhmerNumberFormat.compact(...)`
- `KhmerNumberFormat.percent(...)`
- `KhmerCompactNumberFormat(...)`
- `KhmerPercentFormat(...)`
- `KhmerDateFormat(pattern, ...)`
- `KhmerDateFormat.shortDate(...)`
- `KhmerDateFormat.mediumDate(...)`
- `KhmerDateFormat.fullDate(...)`
- `KhmerDateFormat.fullDateTime(...)`
- `KhmerDateFormat.dateTime(...)`
- `KhmerDateFormat.time(...)`
- `KhmerRelativeTime.format(...)`

### Extensions

- `int.toKhmerDigits()`
- `String.toKhmerDigits()`
- `String.toLatinDigits()`
- `num.toKhmerCurrency(...)`
- `num.toKhmerCompact(...)`
- `num.toKhmerPercent(...)`
- `DateTime.toKhmerDate(...)`
- `DateTime.toKhmerRelativeTime(...)`
- `DateTime.toKhmerChhankitekLunarDate()`
- `DateTime.toKhmerChhankitekLunarDay(...)`
- `DateTime.isKhmerChhankitekSilDay(...)`
- `DateTime.isKhmerChhankitekKorDay(...)`
- `DateTime.toKhmerChhankitekGregorianDate()`
- `DateTime.toKhmerChhankitekIsoDate()`
- `DateTime.toKhmerChhankitekIsoDateTime()`

## Flutter LocalizationsDelegate

A working Khmer `LocalizationsDelegate` example is included in:

- `example/lib/khmer_localizations.dart`
- `example/lib/main.dart`

```dart
localizationsDelegates: const [
  KhmerLocalizations.delegate,
]
```

## Notes

- Chhankitek lunar support range is `1900..2100` for day/year APIs.
- Compact/percent styles are designed to be practical and lightweight.

## Testing

```bash
dart test
```

## License

MIT

### Sponsor Me

If you find my projects helpful and want to support my work, you can sponsor me! 💖

### GitHub Sponsors

[![GitHub Sponsors](https://img.shields.io/badge/Sponsor-me-blue?logo=github&style=for-the-badge)](https://github.com/sponsors/emdiya)

### Connect with Me

[![Telegram](https://img.shields.io/badge/Telegram-Chat-blue?logo=telegram&style=for-the-badge)](https://t.me/emdiya)

### Make a Donation

[![ABA Bank](https://img.shields.io/badge/Donate-ABA%20Bank-blue?style=for-the-badge)](https://pay.ababank.com/juhXjRpfGifNJkHM6)

---

<p align="left">
  <a href="https://github.com/emdiya">
    <img src="https://img.shields.io/badge/Created%20by-Em%20Diya-0ea5e9?style=for-the-badge" alt="Created by Em Diya" />
  </a>
  <br />
  <a href="https://github.com/emdiya">
    <img src="https://img.shields.io/badge/Crafted%20with%20care-%F0%9F%87%B0%F0%9F%87%AD-14b8a6?style=for-the-badge" alt="Crafted with care" />
  </a>
</p>
