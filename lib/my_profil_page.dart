
import 'package:flutter/material.dart';
import 'package:my_profil/profil.dart';

class ProfilPage extends StatefulWidget {
  // 1- Create ProfilPage class with StatefulWidget (Cause I use some Interactif Widget)

  @override
  ProfilPageState createState() => ProfilPageState();
}

class ProfilPageState extends State<ProfilPage> {
  Profil myProfil = Profil(surname: "Anthony", name: "Ringeisen");
  late TextEditingController surname;
  late TextEditingController name;
  late TextEditingController secret;

  bool showSecret = false;

  @override
  void initState() {
    // TODO: implement initState
    super
        .initState(); // Tout ce que l'on va faire pendant l'initialisation du Widget
    surname = TextEditingController();
    name = TextEditingController();
    secret = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    surname.dispose();
    name.dispose();
    secret.dispose();
    surname.text = myProfil.surname;
    name.text = myProfil.name;
    secret.text = myProfil.secret;
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
                  Text("Langage de programmation favori: ${myProfil.favoriteLang}"),
                  ElevatedButton(
                      onPressed: updateSecret,
                      child: Text((showSecret) ? "Cacher secret" : "Montrer secret"),
                  ),
                  (showSecret) ? Text(myProfil.secret) : Container(height: 0, width: 0,),
                ],
              )),
            ),
            const Divider(color: Colors.deepOrangeAccent, thickness: 2,),
            const Text("Modifier les infos", style: TextStyle(
              color: Colors.deepPurple,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),),
            myTextField(controller: surname, hint: "Entrez votre prénom"),
            myTextField(controller: name, hint: "Entrez votre nom"),
            myTextField(controller: secret, hint: "Dites nous un secret", isSecret: true),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Genre: ${myProfil.setGenderString()}"),
                Switch(value: myProfil.gender, onChanged: ((newBool) {
                  setState(() {
                    myProfil.gender = newBool;
                  });
                })),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Taille : ${myProfil.setHeight()}"),
                Slider(value: myProfil.height, min: 0, max: 250, onChanged: ((newHeight){
                  setState(() {
                    myProfil.height = newHeight;
                  });
                }))
              ],
            )
          ],
        ),
      ),
    );
  }

  TextField myTextField({ required TextEditingController controller, required String hint, bool isSecret = false}){
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
      ),
      obscureText: isSecret,
      onSubmitted: ((newValue) {
        updateUser();
      }),
    );
  }

  updateUser(){
    setState(() {
      myProfil = Profil(
        surname: (surname.text != myProfil.name) ? surname.text : myProfil.surname, // recupere le text dans la TextField
        name: (name.text != myProfil.name) ? name.text : myProfil.name,
        secret: secret.text,
      );
    });
  }

  updateSecret(){
    setState(() {
      showSecret = !showSecret;
    });
  }
}
