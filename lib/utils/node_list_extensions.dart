import 'package:yaml_reader/models/line_info.dart';
import 'package:yaml_reader/models/node.dart';

import '../models/end_node.dart';
import '../models/father_node.dart';
import '../models/list_item_end_node.dart';
import '../models/list_item_father_node.dart';
import '../models/list_node.dart';

extension NodeListExtension on List<Node> {
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    for (final node in this) {
      map.addAll(node.toMap());
    }
    return map;
  }

  void addNode(LineInfo lineInfo) {
    if (lineInfo.isListItem) {
      if (lineInfo.hasValue) {
        add(ListItemEndNode(lineInfo.level, {lineInfo.key: lineInfo.value}));
      } else if (lineInfo.hasTwoDots) {
        add(ListItemFatherNode(lineInfo.key, lineInfo.level, []));
      } else {
        add(ListItemNode(lineInfo.key, lineInfo.level));
      }
      return;
    }
    if (lineInfo.hasValue) {
      add(EndNode(lineInfo.level, {lineInfo.key: lineInfo.value}));
    } else {
      add(FatherNode(lineInfo.key, lineInfo.level, []));
    }
  }
}
