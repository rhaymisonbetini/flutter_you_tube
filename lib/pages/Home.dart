import 'package:flutter/material.dart';
import 'package:flutter_you_tube_api/widgets/Biblioteca.dart';
import 'package:flutter_you_tube_api/widgets/CustomSearchDelegate.dart';
import 'package:flutter_you_tube_api/widgets/EmAltar.dart';
import 'package:flutter_you_tube_api/widgets/Inicio.dart';
import 'package:flutter_you_tube_api/widgets/Inscricoes.dart';

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  int indiceAtual = 0;
  String resultado = "";

  @override
  Widget build(BuildContext context) {
    List<Widget> telas = [
      Inicio(resultado),
      EmAlta(),
      Inscricoes(),
      Biblioteca()
    ];

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/youtube.png',
          width: 98,
          height: 22,
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.grey,
            onPressed: () async {
              String res = await showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
              setState(
                () {
                  resultado = res;
                },
              );
            },
          ),
          IconButton(
              icon: Icon(Icons.videocam), color: Colors.grey, onPressed: () {}),
          IconButton(
            icon: Icon(Icons.account_circle),
            color: Colors.grey,
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indiceAtual,
        fixedColor: Colors.red,
        onTap: (index) {
          setState(() {
            indiceAtual = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            label: 'home',
            icon: Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Em alta',
            icon: Icon(
              Icons.whatshot,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Inscrições',
            icon: Icon(
              Icons.subscriptions,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Biblioteca',
            icon: Icon(
              Icons.folder,
            ),
          ),
        ],
      ),
    );
  }
}
