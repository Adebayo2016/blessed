import 'package:intl/intl.dart';

class TimeUtil {
  /// format date
  static String formatDate(String date) {
    if (date.isEmpty) return 'N/A';
    DateTime _dt = DateTime.parse(date);
    return DateFormat("MMM dd, yyyy").format(_dt);
  }

  static String timeFormat(String? updatedAt) {
    final _dt = DateTime.parse(updatedAt!);
    return DateFormat('HH:MM a').format(_dt);
  }

  static String timeFormat2(String? updatedAt) {
    final _dt = DateTime.parse(updatedAt!);
    return DateFormat('HH:MM').format(_dt);
  }
  static String _returnOngoingTime(Duration difference) {
    if (difference.inHours > 24) return 'CLOSES IN: ${difference.inDays} DAYS';
    return 'CLOSES IN: ${difference.inHours}H : ${difference.inMinutes}M : ${difference.inSeconds}S';
  }

  static String _returnUpcomingTime(Duration difference) {
    if (difference.inHours > 24) return 'OPENS IN: ${difference.inDays} DAYS';
    return 'OPENS IN: ${difference.inHours}H : ${difference.inMinutes}M : ${difference.inSeconds}S';
  }
}
