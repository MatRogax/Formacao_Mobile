import 'package:intl/intl.dart';

class utils {
  
  static String convertDate() {

    final DateTime dataAtual = DateTime.now();
    final DateFormat dataFormatada = DateFormat('dd/MM/yyyy');
    final String resultadoFormato = dataFormatada.format(dataAtual);

    return resultadoFormato;
    
  }
}
