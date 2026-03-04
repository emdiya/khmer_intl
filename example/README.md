# khmer_intl Example App

This example shows how each feature in `khmer_intl` is used inside `example/lib/main.dart`.

## Preview

<p align="center">
  <img src="assets/preview_1.png" alt="Example UI Preview 1" width="48%" />
  <img src="assets/preview_2.png" alt="Example UI Preview 2" width="48%" />
</p>

## Install from pub.dev

In your app `pubspec.yaml`:

```yaml
dependencies:
  khmer_intl: ^0.1.1
```

## Import in Code

```dart
import 'package:khmer_intl/khmer_intl.dart';
```

If using Flutter localization delegate (as shown in `example/lib/main.dart`):

```dart
localizationsDelegates: const [
  KhmerLocalizations.delegate,
]
```

## Feature Guide (Demo Code + Result)

### 1) Date Formatting

```dart
final dateKhmerBE = now.toKhmerDate(
  pattern: 'EEE dd MMMM yyyy',
  buddhistEra: true,
  useKhmerDigits: true,
);

final dateKhmerAD = now.toKhmerDate(
  pattern: 'EEE dd MMMM yyyy',
  buddhistEra: false,
  useKhmerDigits: true,
);

final dateNumeric = now.toKhmerDate(
  pattern: 'dd/MM/yyyy',
  buddhistEra: false,
  useKhmerDigits: true,
);

final dateTime = now.toKhmerDate(
  pattern: 'EEEE dd MMMM yyyy a HH:mm:ss',
  buddhistEra: true,
  useKhmerDigits: true,
);
```

Result (sample):

```text
Khmer date (BE): អង្គារ ១៤ ខែមេសា ២៥៦៩
Khmer date (AD): អង្គារ ១៤ ខែមេសា ២០២៦
Numeric: ១៤/០៤/២០២៦
Date + time: ថ្ងៃអង្គារ ១៤ ខែមេសា ២៥៦៩ ព្រឹក 09:30:12
```

### 2) Currency Formatting (KHR)

```dart
final moneyKhDigits = 2500.toKhmerCurrency(useKhmerDigits: true);
final moneyLatinDigits = 2500.toKhmerCurrency(
  useKhmerDigits: false,
  locale: 'en_US',
);
```

Result:

```text
៛ with Khmer digits: ៛២,៥០០
៛ with Latin digits: ៛2,500
```

### 3) Digit Conversion

```dart
final extensionDigits = 1234567890.toKhmerDigits();
final converted = input.toKhmerDigits();
final backToLatin = converted.toLatinDigits();

final stringToKhmer = '123'.toKhmerDigits();
final stringToLatin = '១២៣'.toLatinDigits();
```

Result:

```text
Extension (int): ១២៣៤៥៦៧៨៩០
Function (String): ២០២៦-០៤-១៤ ២៥០០៛
Back to Latin: 2026-04-14 2500៛
'123'.toKhmerDigits(): ១២៣
'១២៣'.toLatinDigits(): 123
```

### 4) Compact Number

```dart
final compact = 1250000.toKhmerCompact(useKhmerDigits: true);
final compactFactory = KhmerNumberFormat.compact(useKhmerDigits: true).format(1200);
final compactCurrencyLatin = KhmerNumberFormat.compactCurrency().format(1200000);
final compactCurrencyKhmer = KhmerNumberFormat.compactCurrency(
  khmerStyle: true,
  useKhmerDigits: true,
).format(1200000);
```

Result:

```text
Compact: ១.៣លាន
KhmerNumberFormat.compact(): ១.២ពាន់
Compact currency (Latin): ៛ 1.2M
Compact currency (Khmer): ៛ ១.២លាន
```

### 5) Percent Formatting

```dart
final percent = 0.275.toKhmerPercent(
  useKhmerDigits: true,
  fractionDigits: 1,
);
final percentFactory = KhmerNumberFormat.percent(useKhmerDigits: true).format(0.25);
```

Result:

```text
Percent: ២៧.៥%
KhmerNumberFormat.percent(): ២៥%
```

### 6) Date Presets

```dart
final presetFullDate =
    KhmerDateFormat.fullDate(buddhistEra: true, useKhmerDigits: true)
        .format(now);
final presetFullDateTime =
    KhmerDateFormat.fullDateTime(buddhistEra: true, useKhmerDigits: true)
        .format(now);
final presetDateTime = KhmerDateFormat.dateTime(useKhmerDigits: true).format(now);
final presetTime = KhmerDateFormat.time(useKhmerDigits: true).format(now);
```

Result:

```text
Preset fullDate(): ថ្ងៃអង្គារ ១៤ ខែមេសា ២៥៦៩
Preset fullDateTime(): ថ្ងៃអង្គារ ១៤ ខែមេសា ២៥៦៩ 09:30:12
Preset dateTime(): ១៤/០៤/២០២៦ 09:30:12
Preset time(): 09:30:12
```

### 7) Relative Time

```dart
final relative = now
    .subtract(const Duration(hours: 2))
    .toKhmerRelativeTime(reference: now, useKhmerDigits: true);
final relativeNow = KhmerRelativeTime.format(now, reference: now);
final relativeYesterday = KhmerRelativeTime.format(
  now.subtract(const Duration(days: 1)),
  reference: now,
);
final relativeFiveDays = KhmerRelativeTime.format(
  now.subtract(const Duration(days: 5)),
  reference: now,
);
```

Result:

```text
Relative (2h ago): ២ ម៉ោងមុន
Relative (now): ឥឡូវនេះ
Relative (yesterday): ម្សិលមិញ
Relative (5 days): មុន 5 ថ្ងៃ
```

### 8) Plural Helper

```dart
final pluralText = khmerPlural(
  2,
  one: 'មានទំនិញ 1 មុខ',
  other: 'មានទំនិញ 2 មុខ',
);
final pluralOfText = KhmerPlural.of(
  count: 2,
  one: '{count} ឯកតា',
  other: '{count} ឯកតា',
);
```

Result:

```text
Plural: មានទំនិញ 2 មុខ
KhmerPlural.of(): 2 ឯកតា
```

### 9) Lunar Date (Chhankitek)

```dart
final lunar = KhmerChhankitek.toKhmerLunarDate(now).toString();
```

Result:

```text
Lunar (chhankitek): ថ្ងៃ... ... ខែ... ឆ្នាំ... ... ព.ស....
```

### 10) Number to Khmer Words

```dart
final numberWords = numberToKhmerWords(1250);
final numberWordsFromExtension = 1250.toKhmerWords();
```

Result:

```text
1250 in Khmer words: មួយពាន់ពីររយហាសិប
```

## Key Files

- `example/lib/main.dart` (full demo UI)
- `example/lib/khmer_localizations.dart` (example `LocalizationsDelegate`)

## Notes

- Lunar date output uses `khmer_lunar_chhankitek`.
- Output examples can vary by current date/time.
