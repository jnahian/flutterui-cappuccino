import 'package:intl/intl.dart';

/// Utility methods for string manipulation.
class Utils {
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

  static String? formatDate(String? dateTime) {
    if (dateTime == null || dateTime.isEmpty) {
      return dateTime;
    }

    DateTime now = DateTime.now();
    DateTime date = DateTime.parse(dateTime).toLocal();

    Duration difference = now.difference(date);

    String timeAgo;
    if (difference.inSeconds < 60) {
      timeAgo = '${difference.inSeconds} Sec Ago';
    } else if (difference.inMinutes < 60) {
      timeAgo = '${difference.inMinutes} Min Ago';
    } else if (difference.inHours < 24) {
      timeAgo = '${difference.inHours} Hours Ago';
    } else {
      timeAgo = '${difference.inDays} Days Ago';
    }

    String formattedTime = DateFormat('hh:mm a').format(date);

    return '$timeAgo | $formattedTime';
  }
}
