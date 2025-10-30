import 'dart:async';

import 'package:flutter/material.dart';

class LlistaPage extends StatefulWidget {
  const LlistaPage({super.key});

  @override
  State<LlistaPage> createState() => _LlistaPageState();
}

class _LlistaPageState extends State<LlistaPage> {
  List<int> _listaNombres = [];
  int _lastImage = 0;
  ScrollController _scrollController = new ScrollController();
  bool _estaCarregant = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List Page')),
      body: Stack(children: [_crearLista(), _crearLoading()]),
    );
  }

  Widget _crearLoading() {
    if (_estaCarregant) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CircularProgressIndicator()],
          ),
          SizedBox(height: 15),
        ],
      );
    }
    else {
      return Container();
    }
  }

  Future<Timer> fetchData() async {
    _estaCarregant = true;
    setState(() {});
    final duration = new Duration(seconds: 2);
    return Timer(duration, peticioHTTP);
  }

  void peticioHTTP() {
    _estaCarregant = false;
    _cargaNuevos();
    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      duration: Duration(milliseconds: 250),
      curve: Curves.fastOutSlowIn,
    );

  }

  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }


  void initState() {
    super.initState();
    _cargaNuevos();
    _scrollController.addListener(() {
      print(_scrollController.position.pixels);
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels == 0) {
          print("ScrollView is at the top");
        } else {
          print("ScrollView is at the bottom");
          fetchData();
        }
      }
    });
  }

   Widget _crearLista(){
    return RefreshIndicator(
     onRefresh: obtenirPagina,
     child: ListView.builder(
       // controller: _scrollController, // Lo activaremos si queremos un scroll infinito
       itemCount: _listaNombres.length,
       itemBuilder: (BuildContext context, int index) {
         final image = _listaNombres[index];
         return FadeInImage(
           placeholder: AssetImage('assets/jar-loading.gif'),
           image: NetworkImage(
             'https://picsum.photos/id/${_listaNombres[index]}/200/300',
           ),
         );
       },
     ),
   );
 }

 Future<Null> obtenirPagina() async{
   final duration = new Duration(seconds: 2);
   new Timer(duration, (){
     // Purgam la llista de nombres
     _listaNombres.clear();
     _lastImage++;
     _cargaNuevos();
   });
   return Future.delayed(duration);
 }



  void _cargaNuevos() {
    for (int i = 0; i < 5; i++) {
      _listaNombres.add(_lastImage);
      _lastImage++;
    }
    setState(() {});
  }
}
