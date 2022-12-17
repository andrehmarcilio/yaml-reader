import 'package:test/test.dart';
import 'package:yaml_reader/yaml_reader.dart';

const String productPath = '/Users/andremarcilio/Desktop/flutterando_masterclass/yaml_reader/lib/mocks/product.yaml';

void main() async {
  final yaml = await Yaml.getYaml(productPath);
  test('when get product should return 1.0.0', () async {
    expect(yaml['product'], '1.0.0');
  });

  test('when get info.name should return example_product', () async {
    expect(yaml['info']['name'], 'example_product');
  });

  test('when get info.title should return Example Product', () async {
    expect(yaml['info']['title'], 'Example Product');
  });

  test('when get info.contact.url should return http://example.com/contact', () async {
    expect(yaml['info']['contact']['url'], "'http://example.com/contact'");
  });

  test('when get info.termsOfService should return "This service is an example only"', () async {
    expect(yaml['info']['termsOfService'], 'This service is an example only');
  });

  test('when get visibility.view.type should return public', () async {
    expect(yaml['visibility']['view']['type'], 'public');
  });

  test('when get texto_bacana should return a big text', () async {
    final text = yaml['texto_bacana'] as String;
    final valid = text.contains('saca só!') && text.contains('usado ali em cima') && text.contains('linhas');
    expect(valid, true);
  });

  test('when get atributos[4].teste.texto_grande should return a big text', () async {
    final text = yaml['atributos'][4]['teste']['texto_grande'] as String;
    final valid = text.contains('um texto de mais') && text.contains('show demais!') && text.contains('linha marota');
    expect(valid, true);
  });

  test('when get atributos[4].teste.textinho should return a meu textinho', () async {
    expect(yaml['atributos'][4]['teste']['textinho'], 'meu textinho');
  });
}
