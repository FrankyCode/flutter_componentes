import 'package:flutter/material.dart';

class InputsPages extends StatefulWidget {
  @override
  _InputsPagesState createState() => _InputsPagesState();
}

class _InputsPagesState extends State<InputsPages> {
  String _nombre = "";
  String _email = "";
  String _fecha = "";

  String _opcionSeleccionada = "Volar";
  List _poderes = ['Volar', 'Rayos X', 'Fuerza', 'Super Aliento'];

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Input Pages"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20.0),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropdown(),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      //autofocus: true,
      textCapitalization: TextCapitalization
          .sentences, // Capitaliza el texto por ejemplo para Nombres
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        counter: Text('Letras ${_nombre.length}'), // Para contadores de Letras
        hintText: 'Nombre de la Persona', // Texto que se muestra previamente
        labelText:
            'Nombre', // Texto que se muestra en la cabecera del TextField
        helperText: 'Solo es el nombre', // Texto de ayuda debajo del TextField
        suffixIcon: Icon(Icons
            .accessibility), // Icono dentro del input pero colocado al final
        icon: Icon(Icons.account_circle), // Icono en el TextField
      ),
      onChanged: (valor) {
        setState(() {
          _nombre = valor;
        });
      },
    );
  }

  Widget _crearEmail() {
    return TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          hintText: 'Email',
          labelText: 'Email',
          helperText: 'Email',
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.email),
        ),
        onChanged: (valor) => setState(() {
              _email = valor;
            }));
  }

  Widget _crearPassword() {
    return TextField(
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          hintText: 'Password',
          labelText: 'Password',
          helperText: 'Password',
          suffixIcon: Icon(Icons.lock_open),
          icon: Icon(Icons.lock),
        ),
        onChanged: (valor) => setState(() {
              _email = valor;
            }));
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: 'Fecha de Nacimiento',
        labelText: 'Fecha de Nacimiento',
        suffixIcon: Icon(Icons.perm_contact_calendar),
        icon: Icon(Icons.calendar_today),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2025),
        locale: Locale('es', 'ES'));

    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
      });
    }
  }

  List<DropdownMenuItem<String>> getOpcionesDropdown() {
    List<DropdownMenuItem<String>> lista = new List();
    _poderes.forEach((poder) {
      lista.add(DropdownMenuItem(child: Text(poder), value: poder,));
    });

    return lista;
  }

  Widget _crearDropdown() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0,),
        DropdownButton(
          value: _opcionSeleccionada,
          items: getOpcionesDropdown(),
          onChanged: (opt) {
            setState(() {
               print(opt); 
               _opcionSeleccionada = opt;
            });
          },
        ),
      ],
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('Nombre: $_nombre'),
      subtitle: Text('Email: $_email'),
      trailing: Text(_opcionSeleccionada),
    );
  }
}
