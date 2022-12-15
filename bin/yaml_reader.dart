import 'package:yaml_reader/yaml_reader.dart';

const String simpleYamlPath =
    '/Users/andremarcilio/Desktop/flutterando_masterclass/yaml_reader/lib/mocks/simple_yaml.yaml';

void main() async {
  final yaml = await Yaml.getYaml(simpleYamlPath);
  print(yaml['description']);
  print(yaml['environment']['sdk']);
}
