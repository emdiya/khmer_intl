enum KhmerPluralCategory { one, other }

KhmerPluralCategory khmerPluralCategory(num count) {
  return count == 1 ? KhmerPluralCategory.one : KhmerPluralCategory.other;
}

String khmerPlural(
  num count, {
  required String one,
  required String other,
}) {
  return khmerPluralCategory(count) == KhmerPluralCategory.one ? one : other;
}
