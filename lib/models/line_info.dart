import 'package:yaml_reader/utils/string_extensions.dart';

class LineInfo {
  final int level;
  final String key;
  final String value;
  final bool isListItem;
  final bool hasTwoDots;
  final bool isLongText;
  final bool isTextLine;

  bool get hasValue => value.isNotEmpty;

  LineInfo._({
    required this.key,
    required this.level,
    required this.value,
    required this.isListItem,
    required this.hasTwoDots,
    required this.isLongText,
    required this.isTextLine,
  });

  factory LineInfo.getLineInfo(String line) {
    bool isListItem = false;
    bool isLongText = false;

    final currentLevel = line.getLeftSpace();

    final hasTwoDots = line.contains(':');

    final values = line.trimRight().split(':');

    var key = values[0].trim();

    if (key.startsWith('-')) {
      isListItem = true;
      key = key.replaceFirst('-', '').trim();
    }

    final isTextLine = !hasTwoDots && !isListItem;

    final value = values.getRange(1, values.length).join(':').split('#')[0].trim();

    if (value.startsWith('|')) {
      isLongText = true;
    }

    return LineInfo._(
      key: key,
      value: value,
      level: currentLevel,
      isListItem: isListItem,
      hasTwoDots: hasTwoDots,
      isLongText: isLongText,
      isTextLine: isTextLine,
    );
  }
}
