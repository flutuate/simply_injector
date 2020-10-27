import 'ILogger.dart';

class FileLogger implements ILogger {
  @override
  void log(String text) {
    print(text);
  }
}
