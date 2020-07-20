//class User {
//  String title;
//  String description;
//
//
//  User(this.title, this.description);
//
//  User.map(dynamic obj) {
//    this.title = obj['title'];
//    this.description = obj['description'];
//
//  }
//
//  String get titl => title;
//  String get des => description;
//
//
//  User.fromMap(Map<String, dynamic> map) {
//    this.title = map[title];
//    this.description = map[description];
//
//  }
//  Map<String, dynamic> toMap() {
//    var map = new Map<String, dynamic>();
//    map["title"] = title;
//    map["description"] = description;
//
//    return map;
//  }
//}



class User {
  int id;
  String name;
  String email;

  User(int id, String name, String email) {
    this.id = id;
    this.name = name;
    this.email = email;
  }

  User.fromJson(Map json)
      : id = json['id'],
        name = json['name'],
        email = json['email'];

  Map toJson() {
    return {'id': id, 'name': name, 'email': email};
  }
}

//class User {
//  String title;
//  String description;
//
//  User( String title, String description) {
//    this.title = title;
//    this.description = description;
//  }
//
//  User.fromJson(Map json)
//      : title = json['title'],
//        description = json['description'];
//
//  Map toJson() {
//    return {'name': title, 'email': description};
//  }
//}

