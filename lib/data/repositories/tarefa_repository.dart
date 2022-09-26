import 'package:app_1a/data/db/database.dart';
import 'package:app_1a/domain/tarefa.dart';

class TarefaRepository {
  
  List<Tarefa> all() {
    return Database.tarefas;
  }
  
}