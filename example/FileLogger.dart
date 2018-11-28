import 'ILogger.dart';

class FileLogger implements ILogger {
  void Log(String text) {
    print(text);
  }
}
