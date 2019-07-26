import 'package:flutter/material.dart';

class HomeTemp extends StatelessWidget{

  final opciones = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'
        ),
        ),
        body: ListView(
          children: _listaCorta()
        ),
        );
  }

  List<Widget> _crearItems(){
    List<Widget> lista = new List<Widget>();
    for (String opt in opciones) {
        final tempWidget = ListTile(
          title: Text(opt),
        );
        // Mostrar la lista en cascada
        lista..add(tempWidget)
             ..add(Divider());
    }
    return lista;
  }

  List<Widget> _listaCorta(){
    var widgets = opciones.map((item){
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(item + '!'),
            subtitle: Text('Cualquier Cosa'),
            leading: Icon(Icons.account_balance),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: (){},
          ),
          Divider(),
        ],
      );
    }).toList();

    return widgets;
  }

}