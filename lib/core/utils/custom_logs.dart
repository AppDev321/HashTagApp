import 'package:logger/logger.dart';

class CustomLogger {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(methodCount: 0), // You can customize the printer
  );

  static void log(String message, {Object? object}) {
    final className = object != null ? object.runtimeType.toString() : "Unknown";
    final logMessage = '[$className] $message';
    _logger.i(logMessage);
  }
}
