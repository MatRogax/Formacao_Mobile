//implementar o erro para tarefa vazia

abstract class CustomException implements Exception {
  CustomException(this.messageError);
  final String messageError;

  String toString();
}

class TaskError extends CustomException {
  
  String messageError = 'Task error: erro ao adcionar tarefa, a Tarefa nao pode estar vazia';
  TaskError(this.messageError):super(messageError);

  @override
  String toString() {
    return messageError;
  }
}
