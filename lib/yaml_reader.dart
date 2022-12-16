import 'dart:io';

import 'models/father_node.dart';
import 'models/line_info.dart';
import 'models/node.dart';
import 'utils/node_list_extensions.dart';
import 'utils/string_extensions.dart';

class Yaml {
  final Map<String, dynamic> _map;

  Yaml._(this._map);

  static Future<Yaml> getYaml(String path) async {
    final List<Node> nodes = [];

    final lines = await _readFileLines(path);

    int minLevel = _getMinLevel(lines);

    for (final line in lines) {
      if (line.isInsignificant()) {
        continue;
      }

      // SetUp Values

      final lineInfo = LineInfo.getLineInfo(line);

      // Add Value in Base

      final isBaseNode = lineInfo.level == minLevel;

      if (isBaseNode) {
        nodes.addNode(lineInfo);
        continue;
      }

      // Get Father Node

      final baseFatherNode = nodes.last as FatherNode;

      final fatherNode = _findFatherNode(baseFatherNode, lineInfo.level);

      // Add Node in FatherNode

      fatherNode.nodes.addNode(lineInfo);
    }

    return Yaml._(nodes.toMap());
  }

  static Future<List<String>> _readFileLines(String path) async {
    final file = File(path);
    final lines = await file.readAsLines();

    return lines;
  }

  static int _getMinLevel(List<String> lines) {
    int? minLevel;
    for (final line in lines) {
      if (line.isInsignificant()) {
        continue;
      }
      int currentLevel = line.getLeftSpace();

      if (minLevel == null || minLevel > currentLevel) {
        minLevel = currentLevel;
      }
    }
    return minLevel ?? 0;
  }

  static FatherNode _findFatherNode(FatherNode fatherNode, int currentLevel) {
    try {
      fatherNode = fatherNode.nodes.lastWhere((node) => node is FatherNode && currentLevel > node.level) as FatherNode;
    } on StateError catch (_) {
      return fatherNode;
    }

    if (fatherNode.level == currentLevel - 1) {
      return fatherNode;
    }
    return _findFatherNode(fatherNode, currentLevel);
  }

  dynamic operator [](String key) => _map[key];
}
