import 'package:test/test.dart';
import 'package:khmer_intl/khmer_intl.dart';

void main() {
  test('converts latin digits to Khmer digits', () {
    expect(toKhmerDigits('123'), '១២៣');
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

  test('supports plural helper', () {
    expect(
      khmerPlural(1, one: '1 item', other: 'many items'),
      '1 item',
    );
    expect(
      khmerPlural(2, one: '1 item', other: 'many items'),
      'many items',
    );
  });

  test('builds an approximate Khmer lunar date', () {
    final lunar = KhmerLunarDate.fromGregorian(DateTime(2026, 2, 15));
    expect(lunar.day, inInclusiveRange(1, 30));
    expect(lunar.month, isNotEmpty);
    expect(lunar.isApproximate, isTrue);
  });
}
