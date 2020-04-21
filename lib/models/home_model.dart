

class Person{
  String name;
  String avatarURL;

  Person.fromMap(Map<String,dynamic> json){
    this.name = json["name"];
    this.avatarURL = json["avatars"]["medium"];
  }
}

class Actor extends Person{
  Actor.fromMap(Map<String,dynamic> json) :super.fromMap(json);

  @override
  String toString() {
    return name;
  }
}

class Director extends Person{
  Director.fromMap(Map<String,dynamic> json) :super.fromMap(json);
}

int _counter = 1;

class MovieItem{
  int rank;
  String imageURL;
  String title;
  String playDate;
  double rating;
  List<String> genres;
  List<Actor> casts;
  Director director;
  String originalTitle;

  MovieItem.fromMap(Map<String,dynamic> json){
    this.rank = _counter++;
    this.imageURL = json["imageURL"];
    this.title = json["title"];
    this.playDate = json["playDate"];
    this.rating = json["rating"];
    this.genres = json["genres"].cast<String>();
    this.casts = (json["casts"] as List<dynamic>).map((item){
      return Actor.fromMap(item);
    }).toList();
    this.director = Director.fromMap(json["director"][0]);
    this.originalTitle = json["originalTitle"];
  }
}