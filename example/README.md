# khmer_intl Example App

This example shows how each feature in `khmer_intl` is used inside `example/lib/main.dart`.

## Preview

<p align="center">
  <img src="assets/preview_1.png" alt="Example UI Preview 1" width="48%" />
  <img src="assets/previrew_2.png" alt="Example UI Preview 2" width="48%" />
</p>

## Install from pub.dev

In your app `pubspec.yaml`:

```yaml
dependencies:
  khmer_intl: ^0.1.0
```

## Import in Code

```dart
import 'package:khmer_intl/khmer_intl.dart';
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
```

Result:

```text
Extension (int): ១២៣៤៥៦៧៨៩០
Function (String): ២០២៦-០៤-១៤ ២៥០០៛
Back to Latin: 2026-04-14 2500៛
```

### 4) Compact Number

```dart
final compact = 1250000.toKhmerCompact(useKhmerDigits: true);
```

Result:

```text
Compact: ១.៣លាន
```

### 5) Percent Formatting

```dart
final percent = 0.275.toKhmerPercent(
  useKhmerDigits: true,
  fractionDigits: 1,
);
```

Result:

```text
Percent: ២៧.៥%
```

### 6) Date Presets

```dart
final presetFullDate =
    KhmerDateFormat.fullDate(buddhistEra: true, useKhmerDigits: true)
        .format(now);
final presetFullDateTime =
    KhmerDateFormat.fullDateTime(buddhistEra: true, useKhmerDigits: true)
        .format(now);
```

Result:

```text
Preset fullDate(): ថ្ងៃអង្គារ ១៤ ខែមេសា ២៥៦៩
Preset fullDateTime(): ថ្ងៃអង្គារ ១៤ ខែមេសា ២៥៦៩ 09:30:12
```

### 7) Relative Time

```dart
final relative = now
    .subtract(const Duration(hours: 2))
    .toKhmerRelativeTime(reference: now, useKhmerDigits: true);
```

Result:

```text
Relative (2h ago): ២ ម៉ោងមុន
```

### 8) Plural Helper

```dart
final pluralText = khmerPlural(
  2,
  one: 'មានទំនិញ 1 មុខ',
  other: 'មានទំនិញ 2 មុខ',
);
```

Result:

```text
Plural: មានទំនិញ 2 មុខ
```

### 9) Lunar Date (Approximate)

```dart
final lunar = KhmerLunarDate.fromGregorian(now).toString().toKhmerDigits();
```

Result:

```text
Lunar (approx): ១៣ កើត ខែមិគសិរ ឆ្នាំថោះ ព.ស. ២៥៦៩
```

## Key Files

- `example/lib/main.dart` (full demo UI)
- `example/lib/khmer_localizations.dart` (example `LocalizationsDelegate`)

## Notes

- Lunar date output is currently approximate.
- Output examples can vary by current date/time.
