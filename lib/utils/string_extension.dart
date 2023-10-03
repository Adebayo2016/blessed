extension StringExtension on String {
  String formatAmount() {
    String amount = replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
    return amount;
  }

  String removeHTML() {
    // return parser.parse(this).text ?? '';

    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    String parsedstring1 = replaceAll(exp, ' ');

    return parsedstring1.replaceAll('&nbsp', '');
  }

  String removeCommas() {
    String amount = replaceAll(',', '');
    return amount;
  }

  String replacePlus234() {
    String phoneNumber = replaceRange(0, 4, '0');
    return phoneNumber;
  }
}
