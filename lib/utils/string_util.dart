/// Utility methods for string manipulation.
class StringUtil {
  /// Capitalizes the first letter of the input string.
  ///
  /// If the input string is null or empty, it returns the input as is.
  static String? capitalize(String? input) {
    if (input == null || input.isEmpty) {
      return input;
    }
    return input[0].toUpperCase() + input.substring(1).toLowerCase();
  }

  /// Capitalizes the first letter of each word in the input string.
  ///
  /// If the input string is null or empty, it returns the input as is.
  static String? capitalizeEachWord(String? input) {
    if (input == null || input.isEmpty) {
      return input;
    }
    return input.split(' ').map((word) {
      if (word.isNotEmpty) {
        return word[0].toUpperCase() + word.substring(1).toLowerCase();
      } else {
        return word;
      }
    }).join(' ');
  }
}
