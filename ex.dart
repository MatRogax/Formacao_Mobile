import 'dart:convert';
import 'dart:io';
import 'constants/Utils.dart';
import 'constants/exception .dart';
import 'models/Aluno.dart';

void main(List<String> args) {
  String nome = utils.lerString("digite o nome do aluno: ");
  var aluno = Aluno(nome);
  double? notas;
  String saida = 's';

  do {
    try {
      notas = utils.lerConsolDouble("digite as notas: ou digite (S) para sair");
      if (notas != null) {
        aluno.addNota(notas);
      }
    } catch (InvalidExeptionNota) {
      print(InvalidExeptionNota);
    }
    
  } while (notas != null);

  var notasExibidas = aluno.getNotas().join(" " + "/ ");
  double mediaCalculada = aluno.mediaDasNotas();
  String result = aluno.imprimirEstado(mediaCalculada);
  String nomeDoAluno = aluno.getNome();

  print("as notas digitadas foram: $notasExibidas");
  print("o aluno foi: $result");
  print("a média do $nomeDoAluno foi: $mediaCalculada");
}
