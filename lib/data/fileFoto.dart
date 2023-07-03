import 'dart:typed_data';

class fileFoto {
  Uint8List? bytes;
  String? name;

  fileFoto({this.bytes, this.name});

  // fileFoto.fromJson(Map<String, dynamic> json) {
  //   bytes = json['bytes'];
  //   name = json['name'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['bytes'] = this.bytes;
  //   data['name'] = this.name;
  //   return data;
  // }
}
