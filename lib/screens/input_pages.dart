import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _name = '';
  String _email = '';
  String _data = '';
  TextEditingController _inputFieldDataController = TextEditingController();
  List<String> _paisos = [
    'Andorra',
    'Anglaterra',
    'Dinamarca',
    'Espanya',
    'França',
  ];
  String _country = 'Andorra';



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Input Page')),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: [
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearDate(context),
          Divider(),
          _crearDropdown(),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  _crearInput() {
    return TextField(
      autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        counter: Text('Letters: ${_name.length}'),
        hintText: 'User name',
        labelText: 'Name',
        suffixIcon: const Icon(Icons.accessibility),
        icon: Icon(Icons.person),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
      onChanged: (value) {
        setState(() {
          _name = value;
          counter:
          Text('Letters: ${_name.length}');
        });
      },
    );
  }

  _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Email',
        labelText: 'Email',
        suffixIcon: Icon(Icons.email),
        icon: Icon(Icons.email),
      ),

      onChanged: (value) {
        setState(() {
          _email = value;
        });
      },
    );
  }

  _crearPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Password',
        labelText: 'Password',
        suffixIcon: Icon(Icons.lock),
        icon: Icon(Icons.lock),
      ),
      onChanged: (value) {},
    );
  }

  Widget _crearDate(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDataController,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Date',
        labelText: 'Date of birth',
        suffixIcon: Icon(Icons.perm_contact_calendar),
        icon: Icon(Icons.calendar_today),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      locale: Locale('es', 'ES  '),
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2026),
    );
    if (picked != null) {
      setState(() {
        _data = picked.toString();
        _inputFieldDataController.text = _data;
      });
    }
  }

  _crearDropdown() {
    return Row(
      children: [
        Icon(Icons.language),
        SizedBox(width: 30.0),
        Expanded(
          child: DropdownButton(
            value: _country,
            items: getOptionDropdown(),
            onChanged: (option) {
              setState(() {
                _country = option as String;
              });
            },
        ),
        )
      ],
    );
  }

  List<DropdownMenuItem<String>> getOptionDropdown() {
    List<DropdownMenuItem<String>> list = [];
    _paisos.forEach((pais) {
      list.add(DropdownMenuItem(
        child: Text(pais),
        value: pais,
      ));
    });
    return list;
  }

  _crearPersona() {
    return ListTile(
      title: Text('Name: $_name'),
      subtitle: Text('Email: $_email'),
      trailing: Text('Country: $_country'),
    );
  }
}
