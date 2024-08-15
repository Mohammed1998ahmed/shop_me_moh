class GetFavortie {
  bool? status;
  String? message;
  GetData? getData;
  GetFavortie();
  GetFavortie.fromJson({Map<String, dynamic>? json}) {
    status = json!['status'];
    message = json['message'];
    getData =
        json['data'] != null ? GetData.fromJson(json: json['data']) : null;
  }
}

class GetData {
  int? current_page;
  List<DataF> dataf = [];
  GetData.fromJson({Map<String, dynamic>? json}) {
    current_page = json!['current_page'];
    json['data'].forEach((element) {
      dataf.add(DataF.fromJson(json: element));
    });
  }
}

class DataF {
//  "id": 128191,
  int? id;
  ProdectF? prodectF;
  DataF.fromJson({Map<String, dynamic>? json}) {
    id = json!['id'];
    prodectF = json['product'] != null
        ? ProdectF.fromJson(json: json['product'])
        : null;
  }
}

class ProdectF {
  int? id;
  int? price;
  int? old_price;
  int? discount;
  String? image;
  String? name;
  String? description;
  ProdectF.fromJson({Map<String, dynamic>? json}) {
    id = json!['id'];
    price = json['price'];
    old_price = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
  }
}
