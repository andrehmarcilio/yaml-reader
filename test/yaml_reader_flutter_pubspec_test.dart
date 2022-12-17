import 'package:test/test.dart';
import 'package:yaml_reader/yaml_reader.dart';

const String pubspecPath = 'lib/mocks/flutter_pubspec.yaml';

void main() async {
  final yaml = await Yaml.getYaml(pubspecPath);
  test('when get name should return pranta_estoque', () async {
    expect(yaml['name'], 'pranta_estoque');
  });

  test('when get publish_to should return none', () async {
    expect(yaml['publish_to'], '\'none\'');
  });

  test('when get environment.sdk should return \'>=2.18.0 <3.0.0\'', () async {
    expect(yaml['environment']['sdk'], '\'>=2.18.0 <3.0.0\'');
  });

  test('when get dependencies.uuid should return ^3.0.6', () async {
    expect(yaml['dependencies']['uuid'], "^3.0.6");
  });

  test('when get flutter.assets[0] should return "assets/images/placeholder.png"', () async {
    expect(yaml['flutter']['assets'][0], 'assets/images/placeholder.png');
  });

  test('when get flutter.fonts[0].family should return Montserrat', () async {
    expect(yaml['flutter']['fonts'][0]['family'], 'Montserrat');
  });

  test('when get flutter.fonts[0].fonts[0].asset should return assets/fonts/Montserrat-Regular.ttf', () async {
    expect(yaml['flutter']['fonts'][0]['fonts'][0]['asset'], 'assets/fonts/Montserrat-Regular.ttf');
  });

  test('when get flutter.fonts[0].fonts[1].weight should return 600', () async {
    expect(yaml['flutter']['fonts'][0]['fonts'][1]['weight'], 600);
  });
}
