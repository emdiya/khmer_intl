import 'package:test/test.dart';
import 'package:khmer_intl/khmer_intl.dart';

void main() {
  test('converts latin digits to Khmer digits', () {
    expect(toKhmerDigits('123'), '១២៣');
  });

  test('converts using String extensions in both directions', () {
    expect('123'.toKhmerDigits(), '១២៣');
    expect('១២៣'.toLatinDigits(), '123');
  });

  test('formats Khmer currency with Khmer digits', () {
    expect(2500.toKhmerCurrency(useKhmerDigits: true), '៛២,៥០០');
  });

  test('formats EEE and EEEE differently for Khmer weekdays', () {
    final date = DateTime(2024, 1, 1); // Monday
    expect(KhmerDateFormat('EEE').format(date), 'ចន្ទ');
    expect(KhmerDateFormat('EEEE').format(date), 'ថ្ងៃចន្ទ');
  });

  test('uses deterministic locale for decimal formatting', () {
    final formatter = KhmerNumberFormat.decimal(locale: 'en_US');
    expect(formatter.format(1234567), '1,234,567');
  });

  test('supports compact factory on KhmerNumberFormat', () {
    expect(KhmerNumberFormat.compact().format(1200), '1.2ពាន់');
    expect(
      KhmerNumberFormat.compact(useKhmerDigits: true).format(1200),
      '១.២ពាន់',
    );
  });

  test('supports percent factory on KhmerNumberFormat', () {
    expect(KhmerNumberFormat.percent().format(0.25), '25%');
    expect(
      KhmerNumberFormat.percent(useKhmerDigits: true).format(0.25),
      '២៥%',
    );
  });

  test('supports compact currency formatter', () {
    expect(
      KhmerNumberFormat.compactCurrency().format(1200000),
      '៛ 1.2M',
    );
    expect(
      KhmerNumberFormat.compactCurrency(
        khmerStyle: true,
        useKhmerDigits: true,
      ).format(1200000),
      '៛ ១.២លាន',
    );
  });

  test('formats compact numbers in Khmer style', () {
    expect(1250000.toKhmerCompact(), '1.3លាន');
    expect(1250000.toKhmerCompact(useKhmerDigits: true), '១.៣លាន');
  });

  test('formats percent values', () {
    expect(0.275.toKhmerPercent(fractionDigits: 1), '27.5%');
    expect(
      0.275.toKhmerPercent(fractionDigits: 1, useKhmerDigits: true),
      '២៧.៥%',
    );
  });

  test('provides relative time in Khmer', () {
    final reference = DateTime(2026, 1, 1, 12);
    final target = reference.subtract(const Duration(hours: 2));
    expect(
      target.toKhmerRelativeTime(reference: reference, useKhmerDigits: true),
      '២ ម៉ោងមុន',
    );
  });

  test('provides now/yesterday/days-ago phrases in Khmer', () {
    final reference = DateTime(2026, 1, 10, 12);
    expect(
      KhmerRelativeTime.format(reference, reference: reference),
      'ឥឡូវនេះ',
    );
    expect(
      KhmerRelativeTime.format(
        reference.subtract(const Duration(days: 1)),
        reference: reference,
      ),
      'ម្សិលមិញ',
    );
    expect(
      KhmerRelativeTime.format(
        reference.subtract(const Duration(days: 5)),
        reference: reference,
      ),
      'មុន 5 ថ្ងៃ',
    );
  });

  test('supports dateTime and time preset constructors', () {
    final date = DateTime(2026, 4, 14, 9, 5, 12);
    expect(KhmerDateFormat.dateTime().format(date), '14/04/2026 09:05:12');
    expect(KhmerDateFormat.time().format(date), '09:05:12');
  });

  test('supports plural helper', () {
    expect(
      khmerPlural(1, one: '1 item', other: 'many items'),
      '1 item',
    );
    expect(
      khmerPlural(2, one: '1 item', other: 'many items'),
      'many items',
    );
    expect(
      KhmerPlural.of(
        count: 2,
        one: '{count} ឯកតា',
        other: '{count} ឯកតា',
      ),
      '2 ឯកតា',
    );
  });

  test('converts number to Khmer words', () {
    expect(numberToKhmerWords(1250), 'មួយពាន់ពីររយហាសិប');
    expect(1250.toKhmerWords(), 'មួយពាន់ពីររយហាសិប');
  });

  test('builds an approximate Khmer lunar date', () {
    final lunar = KhmerLunarDate.fromGregorian(DateTime(2026, 2, 15));
    expect(lunar.day, inInclusiveRange(1, 30));
    expect(lunar.month, isNotEmpty);
    expect(lunar.isApproximate, isTrue);
  });
}
