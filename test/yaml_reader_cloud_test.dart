import 'package:test/test.dart';
import 'package:yaml_reader/yaml_reader.dart';

const String cloudPath = 'lib/mocks/cloud_config.yaml';

void main() async {
  final yaml = await Yaml.getYaml(cloudPath);

  test('when get cloud.name should return MyCloudName', () async {
    expect(yaml['cloud']['name'], 'MyCloudName');
  });

  test('when get cloud.description should return Controller + N Compute Topology - x86 KVM', () async {
    expect(yaml['cloud']['description'], 'Controller + N Compute Topology - x86 KVM');
  });

  test('when get cloud.features.self_service_portal should return enabled', () async {
    expect(yaml['cloud']['features']['self_service_portal'], 'enabled');
  });

  test('when get cloud.features.platform_resource_scheduler should return enabled', () async {
    expect(yaml['cloud']['features']['platform_resource_scheduler'], 'enabled');
  });

  test('when get cloud.topology.database_node_name should return controller', () async {
    expect(yaml['cloud']['topology']['database_node_name'], 'controller');
  });

  test('when get nodes[0].name should return controller', () async {
    expect(yaml['nodes'][0]['name'], 'controller');
  });

  test('when get nodes[0].nics.management_network should return eth0', () async {
    expect(yaml['nodes'][0]['nics']['management_network'], 'eth0');
  });

  test('when get nodes[1].nics.data_network should return eth1', () async {
    expect(yaml['nodes'][1]['nics']['data_network'], 'eth1');
  });
}
