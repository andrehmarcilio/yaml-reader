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
    Map<String, dynamic> map = {name: nodes.first.toMap()};
    for (int i = 1; i < nodes.length; i++) {
      map[name].addAll(nodes[i].toMap());
    }
    return map;
  }
}
