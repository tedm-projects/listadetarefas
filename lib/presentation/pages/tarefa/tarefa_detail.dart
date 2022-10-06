import 'package:app_1a/domain/tarefa.dart';
import 'package:app_1a/presentation/widgets/my_drawer.dart';
import 'package:flutter/material.dart';

class TarefaDetail extends StatelessWidget {

  Tarefa tarefa;
  TarefaDetail(this.tarefa, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: MyDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Descrição:', style: TextStyle(fontSize: 16)),
          Text(tarefa.nome),
          Text('Horário:'),
          Text(tarefa.horario),
          Text('Feito?:'),
          Text(tarefa.feito == true ? 'SIM' : 'NÃO'),
        ],
      ),
    );
  }

}