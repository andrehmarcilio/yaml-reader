import 'package:yaml_reader/models/line_info.dart';
import 'package:yaml_reader/models/node.dart';

import '../models/end_node.dart';
import '../models/father_node.dart';

extension NodeListExtension on List<Node> {
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    for (final node in this) {
      map.addAll(node.toMap());
    }
    return map;
  }

  void addNode(LineInfo lineInfo) {
    if (lineInfo.hasValue) {
      add(EndNode(lineInfo.level, {lineInfo.key: lineInfo.value}));
    } else if (lineInfo.level == lineInfo.level) {
      add(FatherNode(lineInfo.key, lineInfo.level, []));
    }
  }
}
