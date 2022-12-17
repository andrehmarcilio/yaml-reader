import 'package:yaml_reader/models/end_node.dart';

class LongTextNode extends EndNode {
  String key;

  LongTextNode(super.level, super.value, {required this.key});

  void addText(String text) {
    value[key] += '$text\n';
  }
}
