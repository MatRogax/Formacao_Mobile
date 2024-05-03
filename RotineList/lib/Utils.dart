String convertDate() {

  DateTime dataOriginal = DateTime.now(); // Data original
  DateTime dataRevertida =
  DateTime(dataOriginal.day, dataOriginal.month, dataOriginal.year);
  String dataConvertida = dataRevertida.toString(); // Data revertida

  return dataConvertida;
}
