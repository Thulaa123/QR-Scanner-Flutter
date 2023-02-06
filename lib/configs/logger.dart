import 'package:logger/logger.dart';

class Log {
  /*Logs*/
  static final log = Logger(
      printer: HybridPrinter(
          PrettyPrinter(noBoxingByDefault: true, methodCount: 0),
          debug: PrettyPrinter(methodCount: 0),
          error: PrettyPrinter(methodCount: 0),
          warning: PrettyPrinter(methodCount: 0, noBoxingByDefault: true),
          wtf: PrettyPrinter(methodCount: 0)));
}
