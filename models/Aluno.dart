
class Aluno {
  late String _nome = "";
  List<double> _notas = [];

  Aluno(this._nome);

  String getNome() => _nome;

  void setNome(String nome) {
    _nome = nome;
  }

  List<double> getNotas() => _notas;

  void addNota(double nota) {
    _notas.add(nota);
  }

  double mediaDasNotas() {
    double nota, totalNotas = 0, media;
    for (nota in _notas) {
      totalNotas += nota;
    }
    media = totalNotas / _notas.length;
    return media;
  }

  String imprimirEstado(double mediaRecebida) {
    const double mediaCorte = 7.0;
    String result = mediaRecebida >= mediaCorte ? "Aprovado" : "Reprovado";
    return result;
  }
}
