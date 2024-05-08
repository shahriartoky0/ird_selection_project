String convertToBengaliNumber(String englishNumber) {
  final bengaliNumbers = {
    '0': '০',
    '1': '১',
    '2': '২',
    '3': '৩',
    '4': '৪',
    '5': '৫',
    '6': '৬',
    '7': '৭',
    '8': '৮',
    '9': '৯',
  };

  String convertedNumber = "";
  for (var digit in englishNumber.split('')) {
    convertedNumber +=
        bengaliNumbers[digit] ?? digit; // Use original digit if not found
  }
  return convertedNumber;
}