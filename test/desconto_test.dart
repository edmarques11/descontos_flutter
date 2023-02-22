import 'package:flutter_test/flutter_test.dart';
import 'package:desconto/main.dart';

void main() {
  const valorSemDesconto = 150.0;

  test('Deve calcular desconto corretamente utilizando números decimais', () {
    const desconto = 25.0;
    const valorComDesconto = valorSemDesconto - desconto;

    expect(calcularDesconto(valorSemDesconto, desconto, 0), valorComDesconto);
  });

  test('Deve calcular o valor corretamente utilizando porcentagem', () {
    double desconto = 10.0;
    double valorComDesconto = 135.0;

    expect(calcularDesconto(valorSemDesconto, desconto, 1), valorComDesconto);
  });

  test('Deve dar  erro ao calcular valor com desconto negativo ou zero', () {
    expect(() => calcularDesconto(valorSemDesconto, -1, 1),
        throwsA(isA<ArgumentError>()));

    expect(() => calcularDesconto(valorSemDesconto, 0, 0),
        throwsA(isA<ArgumentError>()));
  });

  test('Deve dar erro ao calcular desconto com valor inicial zero', () {
    expect(() => calcularDesconto(0, 15, 0), throwsA(isA<ArgumentError>()));
  });

  test('Deve dar erro ao calcular com valor inicial negativo', () {
    expect(() => calcularDesconto(-1, 15, 0), throwsA(isA<ArgumentError>()));
  });
}
