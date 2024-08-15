// {
//     "status": true,
//     "message": null,
//     "data": {
//         "current_page": 1,
//         "data": [
//             {
//                 "id": 44,
//                 "name": "اجهزه الكترونيه",
//                 "image": "https://student.valuxapps.com/storage/uploads/categories/16301438353uCFh.29118.jpg"
//             },
//             {
//                 "id": 43,
//                 "name": "مكافحة كورونا",
//                 "image": "https://student.valuxapps.com/storage/uploads/categories/1630142480dvQxx.3658058.jpg"
//             },
//             {
//                 "id": 42,
//                 "name": "رياضة",
//                 "image": "https://student.valuxapps.com/storage/uploads/categories/16445270619najK.6242655.jpg"
//             },
//             {
//                 "id": 40,
//                 "name": "ادوات الاناره",
//                 "image": "https://student.valuxapps.com/storage/uploads/categories/16445230161CiW8.Light bulb-amico.png"
//             },
//             {
//                 "id": 46,
//                 "name": "ملابس",
//                 "image": "https://student.valuxapps.com/storage/uploads/categories/1644527120pTGA7.clothes.png"
//             }
//         ],
//         "first_page_url": "http://student.valuxapps.com/api/categories?page=1",
//         "from": 1,
//         "last_page": 1,
//         "last_page_url": "http://student.valuxapps.com/api/categories?page=1",
//         "next_page_url": null,
//         "path": "http://student.valuxapps.com/api/categories",
//         "per_page": 35,
//         "prev_page_url": null,
//         "to": 5,
//         "total": 5
//     }
// }
class Category {
  bool? status;
  DataGategory? dataGategory;

  Category.fromJson({Map<String, dynamic>? json}) {
    status = json!['status'];
    dataGategory =
        json['data'] != null ? DataGategory.fromJson(json: json['data']) : null;
  }
}

class DataGategory {
  List<DatatCatg> datagatg = [];
  DataGategory.fromJson({Map<String, dynamic>? json}) {
    json!['data'].forEach((element) {
      datagatg.add(DatatCatg.fromJson(json: element));
    });
  }
}

class DatatCatg {
  int? id;
  String? name;
  String? image;
  DatatCatg.fromJson({Map<String, dynamic>? json}) {
    id = json!['id'];
    name = json['name'];
    image = json['image'];
  }
}
