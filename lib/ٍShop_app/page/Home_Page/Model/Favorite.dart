// {
//     "status": true,
//     "message": "تم الحذف بنجاح",
//     "data": {
//         "id": 128191,
//         "product": {
//             "id": 55,
//             "price": 44500,
//             "old_price": 44500,
//             "discount": 0,
//             "image": "https://student.valuxapps.com/storage/uploads/products/1615442168bVx52.item_XXL_36581132_143760083.jpeg"
//         }
//     }
// }

class ModelFavortie {
  bool? status;
  String? message;
  ModelDataFavortie? dataFav;
  ModelFavortie.fromJson({Map<String, dynamic>? json}) {
    status = json!['true'];
    message = json['message'];
    dataFav = (json['data'] != null
        ? ModelDataFavortie.fromJson(json['data'])
        : null)!;
  }
}

// "id": 128191,
//         "product": {

class ModelDataFavortie {
  var id;
  ModelProdrct? modelProdrct;
  ModelDataFavortie.fromJson(Map<String, dynamic>? json) {
    id = json!['id'];
    modelProdrct = json['product'] != null
        ? new ModelProdrct.fromJson(json['product'])
        : null;
  }
}

class ModelProdrct {
  int? id;
  int? price;
  int? old_Price;
  int? discount;
  String? image;
  ModelProdrct.fromJson(Map<String, dynamic>? json) {
    id = json!['id'];
    price = json['price'];
    old_Price = json['old_price'];
    image = json['image'];
  }
}
