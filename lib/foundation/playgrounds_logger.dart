import 'dart:developer' as developer;

import 'package:logging/logging.dart';

PlaygroundsLogger logger = PlaygroundsLogger.instance;

class PlaygroundsLogger {
  PlaygroundsLogger._();

  static final instance = PlaygroundsLogger._();

  final _logger = Logger.root;

  void record() {
    _logger.onRecord.listen(
      (event) {
        final level = event.level;
        final time = event.time.toString().substring(11, 23);
        final message = event.message;

        developer.log('[$level $time] $message');
      },
    );
  }

  void info(String message) {
    _logger.info(message);
  }

  void warn(String message) {
    _logger.warning(message);
  }

  void shout(String message) {
    _logger.shout(message);
  }
}
