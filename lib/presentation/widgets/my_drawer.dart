import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(title: Text('Home')),
          ListTile(title: Text('List')),
          ListTile(title: Text('Nova Tarefa')),
          ListTile(title: Text('Update')),
        ],
      ),
    );
  }
}
