import 'package:calculadoraimc/calculadoraimc.dart';
import 'package:test/test.dart';
import 'dart:io';
import 'package:test_process/test_process.dart';

void main() {
  test('Teste de cálculo de IMC', () async {
    final process = await TestProcess.start('dart', ['calculadoraimc/calculadoraimc.dart']);

    process.stdin.writeln('João'); // Entrada para o nome
    process.stdin.writeln('40'); // Entrada para o peso
    process.stdin.writeln('150'); // Entrada para a altura
    process.stdin.writeln('q');    // Enviar um caractere para finalizar a entrada (ou um comando de saída)
        final output =
        await process.stdoutStream().join(); // Captura a saída do processo

    expect(output, contains('João você está com 17.77777777777778 de imc, MAGREZA GRAVE'));
    expect(process.exitCode, 0); // Verifica se o processo encerrou sem erros
  });
}
