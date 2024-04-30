import 'package:app_testes/app_testes.dart' as app;
import 'package:test/test.dart';

void main() {
  test('calculo do produto', () {
    expect(app.calcularDesconto(1000, 150, false), 850);
  });

  test('calculo do desconto com porcentagem', () {
    expect(() => app.calcularDesconto(0, 150, false),
        throwsA(TypeMatcher<ArgumentError>()));
  });

}
