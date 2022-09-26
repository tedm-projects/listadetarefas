import 'package:app_1a/data/repositories/tarefa_repository.dart';
import 'package:app_1a/presentation/pages/tarefa/tarefa_detail.dart';
import 'package:app_1a/presentation/pages/tarefa/tarefa_form.dart';
import 'package:flutter/material.dart';
import 'package:app_1a/domain/tarefa.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TarefaRepository repository = TarefaRepository();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Tarefas')),
      body: Column(
        children: buildListItens(repository.all()),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: ((context) => TarefaForm())));
        },
      ),
    );
  }

  List<Widget> buildListItens(List<Tarefa> tarefas) {
    List<Widget> itens = [];

    for (Tarefa t in tarefas) {
      ListTile tile = ListTile(
        onTap: (() {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => TarefaDetail(t))));
        }),
        title: Text(t.nome),
        subtitle: Text('Hora: ${t.horario}'),
        trailing: IconButton(
          icon: Icon(t.feito == true ? Icons.check_rounded : Icons.warning),
          onPressed: () {
            setState(() {
              t.feito = !t.feito;
            });
          },
        ),
      );

      Dismissible d = Dismissible(
        key: Key(t.id),
        onDismissed: (direction) {
          tarefas.remove(t);  
        },
        background: Container(color: Colors.red,), 
        child: tile,
        );
        
      itens.add(d);
    }

    return itens;
  }
}
