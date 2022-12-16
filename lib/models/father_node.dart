import 'package:yaml_reader/models/list_node.dart';
import 'package:yaml_reader/models/node.dart';

class FatherNode extends Node {
  String name;
  List<Node> nodes;

  FatherNode(this.name, super.level, this.nodes);

  @override
  String toString() {
    return 'NodeFather (name: $name, level: $level, nodes: $nodes)';
  }

  @override
  Map<String, dynamic> toMap() {
    if (nodes.isEmpty) {
      return {name: null};
    }

    if (nodes.first is ListNode) {
      Map<String, dynamic> map = {
        name: [nodes.first.toMap()]
      };

      for (int i = 1; i < nodes.length; i++) {
        if (nodes[i] is ListNode) {
          map[name].add(nodes[i].toMap());
        } else {
          map[name].last.addAll(nodes[i].toMap());
        }
      }

      return map;
    }

    Map<String, dynamic> map = {name: nodes.first.toMap()};

    for (int i = 1; i < nodes.length; i++) {
      map[name].addAll(nodes[i].toMap());
    }
    return map;
  }
}
