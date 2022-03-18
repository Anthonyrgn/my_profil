import 'package:flutter/material.dart';

class ProfilPage extends StatefulWidget {  // 1- Create ProfilPage class with StatefulWidget (Cause I use some Interactif Widget)

  @override
  ProfilPageState createState() => ProfilPageState();

}

class ProfilPageState extends State<ProfilPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState(); // Tout ce que l'on va faire pendant l'initialisation du Widget
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  } //Tout ce que l'on va faire quand le widget sera dispose. Quand le Widget sera supprimé

    @override
  Widget build(BuildContext context) { // Page content
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(title: Text("Mon Profil"),),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Card(
                child: Column(

                ),
              )
            ],
          ),
        ),
    );
  }
}
