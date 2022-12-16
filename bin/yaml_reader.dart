import 'package:yaml_reader/yaml_reader.dart';

const String cloudConfigYaml = 'lib/mocks/cloud_config.yaml';

void main() async {
  final yaml = await Yaml.getYaml(cloudConfigYaml);

  print('cloud name: ${yaml['cloud']['name']}');
}
