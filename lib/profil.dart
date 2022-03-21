class Profil {

  String surname;
  String name;
  int age;
  bool gender;
  double height;
  String secret;
  List<String> hobbies;
  String favoriteLang;

  Profil({

    this.surname = "",
    this.name = "",
    this.age = 0,
    this.gender = true,
    this.height = 0.0,
    this.secret = "",
    this.hobbies = const [],
    this.favoriteLang = "Dart"

  });

  String setName() => "$surname $name";
  String setAge () {
      String ageString = "$age an";
      if(age > 1){
        ageString += "s";
      }
      return ageString;
  }

  String setGenderString() => (gender) ? "Féminin" : "Masculin";

  String setHeight() => "${height.toInt()} cm";

  String setHobbies(){
    String toHobbiesString = "";
    if(hobbies.length == 0){
      return toHobbiesString;
    } else {
      hobbies.forEach((hobbie) {
        toHobbiesString += " $hobbie";
      });
      return toHobbiesString;
    }
  }




}