import 'package:timeago/timeago.dart' as timeago;

class TimeagoConfig {
  static void init() {
    timeago.setLocaleMessages('es', timeago.EsMessages());
  }
}