import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100.0;
  bool _onCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _crearSlide(),
            _crearCheckBox(),
            _crearSwitch(),
            Expanded(child: _crearImagen()),
          ],
        ),
      ),
    );
  }

  Widget _crearSlide() {
    return Slider(
      label: 'Tamaño de la Imagen',    // Mensaje al mover el slide
    //  divisions: 20,                // Segmentacion del Slide cada 20 puntos
      value: _valorSlider,            // valor inicial por el que comienza el SLide
      min: 10.0,                      // valor minimo del SLide
      max: 400.0,                     // valor maximo del Slide
      onChanged:(_onCheck) ? null : (valor) {
        setState(() {
          _valorSlider = valor;
          print(valor);
        });
      },
    );
  }


  Widget _crearImagen() {
    return Image(
      image:
          NetworkImage('https://i.ytimg.com/vi/fq4N0hgOWzU/maxresdefault.jpg'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }

  Widget _crearCheckBox(){
    return CheckboxListTile(            //Destacar que el Checkbox y CheckboxListTile son casi =
      title: Text('Bloquear Slider'),   // Esta es la diferencia del ListTile
      value: _onCheck,
      onChanged: (valor){
          setState(() {
            _onCheck = valor;
          });
      },
    );
  }

  Widget _crearSwitch(){
      return SwitchListTile(
        title: Text('Bloquear Slider'),
        value: _onCheck,
        onChanged: (valor){
          setState(() {
           _onCheck = valor; 
          });
        },
      );
  }

}

