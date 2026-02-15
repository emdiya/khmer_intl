import 'package:flutter/material.dart';
import 'package:khmer_intl/khmer_intl.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'khmer_intl demo',
      theme: ThemeData(useMaterial3: true),
      home: const DemoPage(),
    );
  }
}

class DemoPage extends StatefulWidget {
  const DemoPage({super.key});

  @override
  State<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  final _digitsController = TextEditingController(text: '1234567890');
  String _convertedDigits = toKhmerDigits('1234567890');
  String _convertedBackToLatin = toKhmerDigits('1234567890').toLatinDigits();

  @override
  void initState() {
    super.initState();
    _digitsController.addListener(_onDigitsChanged);
  }

  @override
  void dispose() {
    _digitsController.removeListener(_onDigitsChanged);
    _digitsController.dispose();
    super.dispose();
  }

  void _onDigitsChanged() {
    setState(() {
      _convertedDigits = _digitsController.text.toKhmerDigits();
      _convertedBackToLatin = _convertedDigits.toLatinDigits();
    });
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();

    // Date examples
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
    final presetFullDate = KhmerDateFormat.fullDate(
      buddhistEra: true,
      useKhmerDigits: true,
    ).format(now);
    final presetFullDateTime = KhmerDateFormat.fullDateTime(
      buddhistEra: true,
      useKhmerDigits: true,
    ).format(now);

    // Currency examples
    final moneyKhDigits = 2500.toKhmerCurrency(useKhmerDigits: true);
    final moneyLatinDigits = 2500.toKhmerCurrency(
      useKhmerDigits: false,
      locale: 'en_US',
    );

    // Extension demo
    final extensionDigits = 1234567890.toKhmerDigits();
    final compact = 1250000.toKhmerCompact(useKhmerDigits: true);
    final percent = 0.275.toKhmerPercent(
      useKhmerDigits: true,
      fractionDigits: 1,
    );
    final relative = now
        .subtract(const Duration(hours: 2))
        .toKhmerRelativeTime(reference: now, useKhmerDigits: true);
    final pluralText = khmerPlural(
      2,
      one: 'មានទំនិញ 1 មុខ',
      other: 'មានទំនិញ 2 មុខ',
    );
    final lunar = KhmerLunarDate.fromGregorian(now).toString().toKhmerDigits();

    return Scaffold(
      appBar: AppBar(title: const Text('khmer_intl demo')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _SectionTitle(
            title: 'Date formatting',
            subtitle: 'Khmer months/weekdays + optional Buddhist Era year',
          ),
          _InfoCard(
            rows: [
              _RowItem(label: 'Khmer date (BE)', value: dateKhmerBE),
              _RowItem(label: 'Khmer date (AD)', value: dateKhmerAD),
              _RowItem(label: 'Numeric (Khmer digits)', value: dateNumeric),
              _RowItem(label: 'Date + time', value: dateTime),
            ],
          ),
          const SizedBox(height: 20),

          _SectionTitle(
            title: 'Currency formatting (KHR ៛)',
            subtitle: 'With and without Khmer digits',
          ),
          _InfoCard(
            rows: [
              _RowItem(label: '៛ with Khmer digits', value: moneyKhDigits),
              _RowItem(label: '៛ with Latin digits', value: moneyLatinDigits),
            ],
          ),
          const SizedBox(height: 20),

          _SectionTitle(
            title: 'Digit conversion',
            subtitle: 'Convert any string that contains digits 0-9',
          ),
          _InfoCard(
            rows: [
              _RowItem(label: 'Extension (int)', value: extensionDigits),
              _RowItem(label: 'Function (String)', value: _convertedDigits),
              _RowItem(label: 'Back to Latin', value: _convertedBackToLatin),
            ],
          ),
          const SizedBox(height: 12),

          TextField(
            controller: _digitsController,
            decoration: const InputDecoration(
              labelText: 'Try typing numbers',
              hintText: 'Example: 2026-04-14 2500៛',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Converted: $_convertedDigits',
            style: Theme.of(context).textTheme.titleMedium,
          ),

          const SizedBox(height: 24),
          _SectionTitle(
            title: 'Tip for your package',
            subtitle:
                'Add more examples here as you expand: time formatting, more patterns, compact numbers, etc.',
          ),
          const SizedBox(height: 20),
          _SectionTitle(
            title: 'More features',
            subtitle: 'Compact, percent, presets, plural, relative time, lunar',
          ),
          _InfoCard(
            rows: [
              _RowItem(label: 'Compact', value: compact),
              _RowItem(label: 'Percent', value: percent),
              _RowItem(label: 'Preset fullDate()', value: presetFullDate),
              _RowItem(
                label: 'Preset fullDateTime()',
                value: presetFullDateTime,
              ),
              _RowItem(label: 'Relative (2h ago)', value: relative),
              _RowItem(label: 'Plural', value: pluralText),
              _RowItem(label: 'Lunar (approx)', value: lunar),
            ],
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  final String subtitle;

  const _SectionTitle({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 4),
          Text(subtitle, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final List<_RowItem> rows;

  const _InfoCard({required this.rows});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
            for (int i = 0; i < rows.length; i++) ...[
              _KeyValueRow(label: rows[i].label, value: rows[i].value),
              if (i != rows.length - 1) const Divider(height: 18),
            ],
          ],
        ),
      ),
    );
  }
}

class _RowItem {
  final String label;
  final String value;

  const _RowItem({required this.label, required this.value});
}

class _KeyValueRow extends StatelessWidget {
  final String label;
  final String value;

  const _KeyValueRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 160,
          child: Text(
            label,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: SelectableText(
            value,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
