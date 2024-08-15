// {
//     "status": true,
//     "message": "تم التسجيل بنجاح",
//     "data": {
//         "name": "mohammed aahmed",
//         "phone": "09970243333349",
//         "email": "mohammeda.log@gmail.com",
//         "id": 53719,
//         "image": "https://student.valuxapps.com/storage/uploads/users/DcdIgRYRlo_1679398119.jpeg",
//         "token": "uqOFSRPpjVCsn1NOStj1cFgtb076G4yDgYoZZtIKGXHveItSZuQ554PmXubmjBbpuHMUM0"
//     }
// }

class ModelRegister {
  bool? status;
  String? message;
  ModelDatar? data;
  ModelRegister();
  ModelRegister.fromJson({Map<String, dynamic>? json}) {
    status = json!['status'];
    message = json['message'];
    data =
        json['data'] != null ? ModelDatar.fromJson(json: json['data']) : null;
  }
}

// "name": "mohammed aahmed",
//         "phone": "09970243333349",
//         "email": "mohammeda.log@gmail.com",
//         "id": 53719,
//         "image": "https://student.valuxapps.com/storage/uploads/users/DcdIgRYRlo_1679398119.jpeg",
//         "token": "uqOFSRPpjVCsn1NOStj1cFgtb076G4yDgYoZZtIKGXHveItSZuQ554PmXubmjBbpuHMUM0"
//
class ModelDatar {
  String? name;
  String? phone;
  String? email;
  int? id;
  var image;

  String? token;

  ModelDatar.fromJson({Map<String, dynamic>? json}) {
    id = json!['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    image = json['image'];
    token = json['token'];
  }
}
