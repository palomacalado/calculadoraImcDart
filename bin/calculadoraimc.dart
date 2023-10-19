import 'dart:math';

import 'package:calculadoraimc/calculadoraimc.dart' as calculadoraimc;
import 'package:calculadoraimc/calculadoraimc.dart';
import 'package:calculadoraimc/classes/Pessoa.dart';
import 'dart:io';

void main(List<String> arguments) {
  print("Qual seu nome?");
  String nome = stdin.readLineSync()!;
  print("Qual seu peso?");
  double peso = double.parse(stdin.readLineSync()!);
  print("Qual sua altura? (em cm)");
  double altura = double.parse(stdin.readLineSync()!);
  if (peso <= 0 || altura <= 0) {
    throw "Peso e altura devem ser maiores que zero.";
  }
  Pessoa pessoa = Pessoa(nome, peso, altura);
  peso = pessoa.getPeso();
  altura = pessoa.getAltura();
  try {
    IMC(nome, altura, peso);
  } catch (e) {
    print("Erro: $e");
  }
}
