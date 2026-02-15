const _khmerLunarMonths = <String>[
  'មិគសិរ',
  'បុស្ស',
  'មាឃ',
  'ផល្គុន',
  'ចេត្រ',
  'ពិសាខ',
  'ជេស្ឋ',
  'អាសាឍ',
  'ស្រាពណ៍',
  'ភទ្របទ',
  'អស្សុជ',
  'កក្ដិក',
];

const _khmerZodiacYears = <String>[
  'ជូត',
  'ឆ្លូវ',
  'ខាល',
  'ថោះ',
  'រោង',
  'ម្សាញ់',
  'មមី',
  'មមែ',
  'វក',
  'រកា',
  'ច',
  'កុរ',
];

class KhmerLunarDate {
  final int day;
  final String month;
  final int buddhistEraYear;
  final String zodiacYear;
  final bool isApproximate;

  const KhmerLunarDate({
    required this.day,
    required this.month,
    required this.buddhistEraYear,
    required this.zodiacYear,
    this.isApproximate = true,
  });

  factory KhmerLunarDate.fromGregorian(DateTime date) {
    // Approximation using average synodic month length.
    final utcDate = DateTime.utc(date.year, date.month, date.day);
    final refDate = DateTime.utc(2000, 1, 6);
    final days = utcDate.difference(refDate).inDays;

    const lunarCycle = 29.530588;
    final monthOffset = (days / lunarCycle).floor();
    final dayInCycle = (days - (monthOffset * lunarCycle)).floor() + 1;

    final monthIndex = ((monthOffset % 12) + 12) % 12;
    final beYear = date.year + 543;
    final zodiac = _khmerZodiacYears[beYear % 12];

    final safeDay = dayInCycle < 1
        ? 1
        : (dayInCycle > 30 ? 30 : dayInCycle);

    return KhmerLunarDate(
      day: safeDay,
      month: _khmerLunarMonths[monthIndex],
      buddhistEraYear: beYear,
      zodiacYear: zodiac,
      isApproximate: true,
    );
  }

  @override
  String toString() {
    return '$day កើត ខែ$month ឆ្នាំ$zodiacYear ព.ស. $buddhistEraYear';
  }
}
