import 'package:yaml_reader/models/node.dart';

class EndNode extends Node {
  Map<String, dynamic> value;

  EndNode(super.level, this.value);

  @override
  String toString() {
    return 'Node (level: $level, line: $value)\n';
  }

  @override
  Map<String, dynamic> toMap() => value;
}
