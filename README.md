# khmer_intl

Khmer (`km`) internationalization helpers for Dart and Flutter.

`khmer_intl` gives you Khmer-friendly formatting utilities for digits, numbers, currency, dates, relative time, plural selection, and an approximate lunar date model.

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
- Approximate Khmer lunar date model
- Number-to-Khmer words conversion (`1250` -> `មួយពាន់ពីររយហាសិប`)
- Extension methods for `int`, `num`, `String`, and `DateTime`

## Installation

```yaml
dependencies:
  khmer_intl: ^0.1.1
```

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

### Lunar Date (Approximate)

```dart
final lunar = KhmerLunarDate.fromGregorian(DateTime.now());
print(lunar);
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

- Khmer lunar support is currently **approximate** (starter implementation).
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
