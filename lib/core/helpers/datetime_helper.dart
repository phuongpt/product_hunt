import 'package:timeago/timeago.dart' as timeago;

class DateTimeHelper {
  static String timeFromNow(DateTime dateTime) {
    final difference = DateTime.now().difference(dateTime);
    final fifteenAgo = DateTime.now().subtract(difference);
    return timeago.format(fifteenAgo);
  }
}
