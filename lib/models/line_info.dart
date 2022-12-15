import 'package:yaml_reader/utils/string_extensions.dart';

class LineInfo {
  final String key;
  final String value;
  final int level;

  bool get hasValue => value.isNotEmpty;

  LineInfo._({required this.level, required this.value, required this.key});

  factory LineInfo.getLineInfo(String line) {
    final currentLevel = line.getLeftSpace();

    final values = line.trimRight().split(':');

    final key = values[0].trim();
    final value = values.getRange(1, values.length).join(':').split('#')[0].trim();

    return LineInfo._(key: key, value: value, level: currentLevel);
  }
}
