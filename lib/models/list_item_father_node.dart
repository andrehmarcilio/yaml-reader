import 'package:yaml_reader/models/father_node.dart';
import 'package:yaml_reader/models/list_node.dart';

class ListItemFatherNode extends FatherNode implements ListNode {
  ListItemFatherNode(super.name, super.level, super.nodes);
}
