import 'dart:math' as math;

extension IterableExtensions on Iterable<String> {
  /// Check if substring exists in iterable
  bool containsSubstring(String substring) {
    var contains = false;
    this.forEach((element) {
      if (substring.contains(element)) {
        contains = true;
      }
    });
    return contains;
  }
}

extension IterableNumberExtensions on Iterable<double> {

  double get min => reduce(math.min);

  double get max => reduce(math.max);
}
