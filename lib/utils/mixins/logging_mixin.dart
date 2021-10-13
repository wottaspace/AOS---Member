import 'package:logger/logger.dart';

mixin LoggingMixin {
  final Logger logger = Logger(
    printer: PrettyPrinter()
  );
}