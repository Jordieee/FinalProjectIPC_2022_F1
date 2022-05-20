class Teams {
  late List<Team> teams;

  Teams({required this.teams});

  Teams.fromJson(Map<String, dynamic> json) {
    if (json['teams'] != null) {
      teams = <Team>[];
      json['teams'].forEach((v) {
        teams.add(Team.fromJson(v));
      });
    }
  }
}

class Team {
  late String name;
  late String image;

  late String shirtimage;
  late String shirtdesc;
  late String shirtprice;

  late String capimage;
  late String capdesc;
  late String capprice;

  late String helmetimage;
  late String helmetdesc;
  late String helmetprice;

  late String carimage;
  late String cardesc;
  late String carprice;



  Team(
      {required this.name,
        required this.image,
        required this.shirtimage,
        required this.shirtdesc,
        required this.shirtprice,

        required this.capimage,
        required this.capdesc,
        required this.capprice,

        required this.helmetimage,
        required this.helmetdesc,
        required this.helmetprice,

        required this.carimage,
        required this.cardesc,
        required this.carprice,
      });

  Team.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];

    shirtimage = json['shirtimage'];
    shirtdesc = json['shirtdesc'];
    shirtprice = json['shirtprice'];

    capimage = json['capimage'];
    capdesc = json['capdesc'];
    capprice = json['capprice'];

    helmetimage = json['helmetimage'];
    helmetdesc = json['helmetdesc'];
    helmetprice = json['helmetprice'];

    carimage = json['carimage'];
    cardesc = json['cardesc'];
    carprice = json['carprice'];
  }
}




