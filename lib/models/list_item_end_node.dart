import 'package:yaml_reader/models/list_node.dart';

import 'end_node.dart';

class ListItemEndNode extends EndNode implements ListNode {
  ListItemEndNode(super.level, super.value);
}
