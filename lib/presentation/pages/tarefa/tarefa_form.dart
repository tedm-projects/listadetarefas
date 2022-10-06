import 'package:app_1a/data/repositories/tarefa_repository.dart';
import 'package:app_1a/domain/tarefa.dart';
import 'package:flutter/material.dart';

class TarefaForm extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController tituloCtrl = TextEditingController();
  TextEditingController horarioCtrl = TextEditingController();

  TarefaRepository repository = TarefaRepository();

  TarefaForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: tituloCtrl,
                decoration: const InputDecoration(hintText: 'Título:', border: OutlineInputBorder(), labelText: 'título',
),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório!';
                  }
                },
              ),
              SizedBox(height: 5,),
              TextFormField(
                controller: horarioCtrl,
                decoration: const InputDecoration(hintText: 'Horário:', border: OutlineInputBorder()),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório!';
                  }
                },
              ),
              OutlinedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Tarefa tarefa =
                          Tarefa('9', tituloCtrl.text, horarioCtrl.text, false);

                      repository.add(tarefa);
                      Navigator.pop(context);
                    }
                  },
                  child: Text('OK'))
            ],
          ),
        ),
      ),
    );
  }
}
