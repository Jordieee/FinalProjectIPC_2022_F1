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
  late String team;
  late String image;

  Team(
      {required this.team,
        required this.image,});

  Team.fromJson(Map<String, dynamic> json) {
    team = json['team'];
    image = json['image'];
  }
}




