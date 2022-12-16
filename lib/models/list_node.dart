import 'package:yaml_reader/models/node.dart';

abstract class ListNode {}

class ListItemNode extends Node implements ListNode {
  String value;

  ListItemNode(this.value, super.level);

  @override
  String toMap() {
    return value;
  }
}
