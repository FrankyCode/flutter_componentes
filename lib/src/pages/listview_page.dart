import 'dart:async';

import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {

  ScrollController _scrollController = new ScrollController();
  List<int> _listaNumeros = new List();
  int _ultimoItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    _agregar10();

    _scrollController.addListener((){
        if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
          // Si la posicion en pixeles es igual al largo maximo de la pagina 
          //_agregar10();
          fetchData();
        }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List"),),
      body: Stack(children: <Widget>[
        _crearLista(),
        _crearLoading(),
        ],),
      
    );
  }

  Widget _crearLista(){
    return RefreshIndicator(
        onRefresh: obtenerPagina1,
        child: ListView.builder(
        controller: _scrollController,                  // Esto nos va a permitir mover de posicion
        itemCount: _listaNumeros.length,                // Cantidad de items de la lista
        itemBuilder: (BuildContext context, int index){
          final imagen = _listaNumeros[index];
          return FadeInImage(
            image: NetworkImage('https://picsum.photos/id/$imagen/500/400'),
            placeholder: AssetImage('assets/jar-loading.gif'),
          );
        },
      ),
    );
  }

  // Con este metodo refrescamos la pagina y de paso mostramos las siguientes
  Future<Null> obtenerPagina1()async{
    final duration = new Duration(seconds: 2);  // Añadir 2 segundos de Duracion de carga
     new Timer(duration, (){
      _listaNumeros.clear();    // Limpia la pagina de las imagenes que tenemos
      _ultimoItem++;            // Guarda la posicion de la ultima imagen
      _agregar10();             // agregamos 10 nuevas imagenes
    });

    return Future.delayed(duration); // Añadimos un pequeño delay para esperar que cargue 
  }

  // Agregar 10 items a la lista
  void _agregar10(){
    for (var i = 1; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }
    setState(() {});

  }


  // Traer informacion
  Future fetchData() async{
      _isLoading = true;
      setState(() {});

      final duration = new Duration(seconds: 2);
      return new Timer(duration, respuestaHTTP);
    

  }

  // Este metodo es el encargado de manejar nuestra respuesta HTTP
  void respuestaHTTP(){
    _isLoading = false;
    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 250)
    );
    _agregar10();

  }

  // Como su nombre indica lo usaremos para crear un Loading 
  // cada vez que carga nuevos objetos
  Widget _crearLoading(){
    if(_isLoading){
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            CircularProgressIndicator()
          ],),
          SizedBox(height: 15.0),
        ],
      );
    }else{
      return Container();
    }
  }



  // Como todo controller necesitamos un dispose para cerrar
  @override
  void dispose(){
    super.dispose();
    _scrollController.dispose();
  }

}