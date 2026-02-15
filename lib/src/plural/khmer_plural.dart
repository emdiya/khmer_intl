enum KhmerPluralCategory { one, other }

KhmerPluralCategory khmerPluralCategory(num count) {
  return count == 1 ? KhmerPluralCategory.one : KhmerPluralCategory.other;
}

class KhmerPlural {
  const KhmerPlural._();

  static String of({
    required num count,
    required String one,
    required String other,
  }) {
    final template =
        khmerPluralCategory(count) == KhmerPluralCategory.one ? one : other;
    return template.replaceAll('{count}', count.toString());
  }
}

String khmerPlural(
  num count, {
  required String one,
  required String other,
}) {
  return KhmerPlural.of(count: count, one: one, other: other);
}
