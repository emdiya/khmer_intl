# Changelog

All notable changes to this project will be documented in this file.

The format follows Keep a Changelog style and is adapted for pub.dev package releases.

## 0.2.1 - 2026-03-14

### Changed

- Updated `khmer_lunar_chhankitek` dependency from `^1.0.0` to `^1.0.1`.
- Refreshed example dependency resolution for the new Chhankitek release.

## 0.2.0 - 2026-03-04

### Added

- Integrated `khmer_lunar_chhankitek: ^1.0.0` as a direct dependency.
- New Chhankitek bridge API:
  - `KhmerChhankitek.day(...)`
  - `KhmerChhankitek.month(...)`
  - `KhmerChhankitek.year(...)`
  - `KhmerChhankitek.isSilDay(...)`
  - `KhmerChhankitek.isKorDay(...)`
  - `KhmerChhankitek.toKhmerLunarDate(...)`
  - `KhmerChhankitek.khmerNewYearByJsYear(...)`
  - `KhmerChhankitek.khmerNewYearByGregorianYear(...)`
  - `KhmerChhankitek.formatKhmerGregorianDate(...)`
  - `KhmerChhankitek.formatIsoDate(...)`
  - `KhmerChhankitek.formatIsoDateTime(...)`
  - `KhmerChhankitek.toKhmerDigits(...)`
- New `DateTime` extensions for Chhankitek integration:
  - `toKhmerChhankitekLunarDate()`
  - `toKhmerChhankitekLunarDay(...)`
  - `isKhmerChhankitekSilDay(...)`
  - `isKhmerChhankitekKorDay(...)`
  - `toKhmerChhankitekGregorianDate()`
  - `toKhmerChhankitekIsoDate()`
  - `toKhmerChhankitekIsoDateTime()`
- New/updated tests covering Chhankitek bridge APIs and extensions.

### Changed

- Public lunar API now centers on `KhmerChhankitek` (engine-backed) for Khmer date and lunar features.
- Example app date/lunar presentation updated to use Chhankitek-based outputs.
- Main and example README files updated with integrated usage, demo source code, and demo outputs.

### Removed

- Removed approximate lunar model:
  - Deleted `lib/src/lunar/khmer_lunar_calendar.dart`
  - Removed `KhmerLunarDate.fromGregorian(...)` from public exports

### Breaking

- `KhmerLunarDate` and `KhmerLunarDate.fromGregorian(...)` are no longer available.
- Migrate to:
  - `KhmerChhankitek.toKhmerLunarDate(...)` for formatted Khmer lunar date
  - `KhmerChhankitek.day/month/year/isSilDay/isKorDay(...)` for engine-backed lunar calculations

## 0.1.1 - 2026-02-15

### Added

- `KhmerPlural.of(...)` with `{count}` template replacement.
- `KhmerNumberFormat.compactCurrency(...)` for financial compact output:
  - `៛ 1.2M`
  - `៛ ១.២លាន`
- `KhmerDateFormat.dateTime()` preset constructor.
- `KhmerDateFormat.time()` preset constructor.
- Improved `KhmerRelativeTime.format(...)` phrases:
  - `ឥឡូវនេះ`
  - `ម្សិលមិញ`
  - `មុន 5 ថ្ងៃ`
- Number to Khmer words conversion:
  - `numberToKhmerWords(1250)` -> `មួយពាន់ពីររយហាសិប`
  - `int.toKhmerWords()`
- Documentation and example updates:
  - Updated `README.md` with new APIs and examples
  - Updated `example/README.md` with feature guide and outputs
  - Updated example app (`example/lib/main.dart`) to show new features

## 0.1.0 - 2026-02-15

### Added

- Core digit conversion:
  - `toKhmerDigits(String)`
  - `toLatinDigits(String)`
- Number formatting:
  - `KhmerNumberFormat.decimal(...)`
  - `KhmerNumberFormat.currencyKHR(...)`
  - `KhmerCompactNumberFormat`
  - `KhmerPercentFormat`
- Date formatting:
  - `KhmerDateFormat(pattern, ...)`
  - Presets: `shortDate`, `mediumDate`, `fullDate`, `fullDateTime`
  - Khmer month/weekday data and Buddhist Era support
- Extensions:
  - `int.toKhmerDigits()`
  - `String.toKhmerDigits()`
  - `String.toLatinDigits()`
  - `num.toKhmerCurrency(...)`
  - `num.toKhmerCompact(...)`
  - `num.toKhmerPercent(...)`
  - `DateTime.toKhmerDate(...)`
  - `DateTime.toKhmerRelativeTime(...)`
- Relative time helper:
  - `KhmerRelativeTime.format(...)`
- Plural helper:
  - `khmerPlural(...)`
- Khmer lunar date model (approximate):
  - `KhmerLunarDate.fromGregorian(...)`
- Example app enhancements:
  - Expanded demo UI covering all major features
  - Example Khmer `LocalizationsDelegate`
- Documentation improvements:
  - Updated main `README.md` for pub.dev
  - Added detailed `example/README.md` guide with demo code and sample results
  - Added screenshot previews

### Changed

- Migrated from template scaffold files to package-focused API surface.
- Replaced default tests with feature-oriented tests.
- Updated lint configuration for pure Dart package workflow.

### Fixed

- Resolved invalid number-format subclassing issues.
- Fixed extension recursion/namespace collisions.
- Corrected analyzer/test issues across package and example.
