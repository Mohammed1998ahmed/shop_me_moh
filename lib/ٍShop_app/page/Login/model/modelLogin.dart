class ModelLogin {
  bool? statues;
  String? message;
  ModelData? data;
  ModelLogin();
  ModelLogin.fromJson({Map<String, dynamic>? json}) {
    statues = json!['status'];
    message = json['message'];
    data = json['data'] != null ? ModelData.fromJson(json: json['data']) : null;
  }
}

class ModelData {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  int? points;
  int? credit;
  String? token;
  ModelData.fromJson({Map<String, dynamic>? json}) {
    id = json!['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    points = json['points'];
    credit = json['credit'];
    token = json['token'];
  }
}
