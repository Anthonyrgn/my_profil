import 'package:flutter/material.dart';
import 'package:my_profil/profil.dart';

class ProfilPage extends StatefulWidget {
  // 1- Create ProfilPage class with StatefulWidget (Cause I use some Interactif Widget)

  @override
  ProfilPageState createState() => ProfilPageState();
}

class ProfilPageState extends State<ProfilPage> {
  Profil myProfil = Profil(surname: "Anthony", name: "Ringeisen");

  @override
  void initState() {
    // TODO: implement initState
    super
        .initState(); // Tout ce que l'on va faire pendant l'initialisation du Widget
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  } //Tout ce que l'on va faire quand le widget sera dispose. Quand le Widget sera supprimé

  @override
  Widget build(BuildContext context) {
    // Page content
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Mon Profil"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Card(
              color: Colors.lightBlue,
              elevation: 20,
              child: Container(
                width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(8),
                  child: Column(
                children: [
                  Text(myProfil.setName()),
                  Text("Age: ${myProfil.setAge()}"),
                  Text("Taille: ${myProfil.setHeight()}"),
                  Text("Genre: ${myProfil.setGenderString()}"),
                  Text("Hobbies: ${myProfil.setHobbies()}"),
                  Text("Langage de programmation favori: ${myProfil.favoriteLang}")
                ],
              )),
            ),
            Divider(color: Colors.deepOrangeAccent, thickness: 2,)
          ],
        ),
      ),
    );
  }
}
