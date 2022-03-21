
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
  late TextEditingController age;

  bool showSecret = false;

  Map<String, bool> hobbies = {
    "Pétanque": false,
    "Football": false,
    "Rugby": false,
    "Code": false,
    "Manga": false
  };

  @override
  void initState() {
    // TODO: implement initState
    super
        .initState(); // Tout ce que l'on va faire pendant l'initialisation du Widget
    surname = TextEditingController();
    name = TextEditingController();
    secret = TextEditingController();
    age = TextEditingController();
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
    age.text = myProfil.age.toString();
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
            myTitle("Modifier les infos"),
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
            ),
            Divider(color: Colors.deepPurple, thickness: 2,),
            myHobbies(),
            Divider(color: Colors.deepPurple, thickness: 2,),
            myRadios(),
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
        favoriteLang: myProfil.favoriteLang,
        hobbies: myProfil.hobbies,
        height: myProfil.height,
        age: myProfil.age,
        gender: myProfil.gender,
      );
    });
  }

  updateSecret(){
    setState(() {
      showSecret = !showSecret;
    });
  }

  Column myHobbies(){
    List<Widget> widgets = [myTitle("Mes hobbies")];
    hobbies.forEach((hobby, like) {
      Row r = Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(hobby),
          Checkbox(value: like, onChanged: ((newBool) {
            setState(() {
              hobbies[hobby] = newBool ?? false;
              List<String> str = [];
              hobbies.forEach((key, value) {
                if(value == true){
                  str.add(key + ",");
                }
              });
              myProfil.hobbies = str;
            });
          }))
        ],
      );
      widgets.add(r);
    });
    return Column(children: widgets,);
  }

  Row myRadios(){
    List<Widget> w = [myTitle("Langage préféré")];
    List<String> langs = ["Dart", "Swift", "Kotlin", "Java", "Python"];
    int index = langs.indexWhere((lang) => lang.startsWith(myProfil.favoriteLang));
    for (var x = 0; x < langs.length; x++){
      Column c = Column(
        children: [
          Text(langs[x]),
          Radio(value: x, groupValue: index, onChanged: ((newValue) {
            setState(() {
              myProfil.favoriteLang = langs[newValue as int];
            });
          }))
        ],
      );
      w.add(c);
    }
    return Row(
      children: w,
    );
  }

  Text myTitle(String text){
    return Text(
      text,
      style: const TextStyle(
        color: Colors.deepPurple,
        fontWeight: FontWeight.bold,
        fontSize: 18
      ),
    );
  }
}
