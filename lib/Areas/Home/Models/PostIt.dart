// ignore_for_file: non_constant_identifier_names, file_names
class PostIt {
  PostIt({this.id, this.text});

  int? id;
  String? text;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'id_matter': text,
    };
    return map;
  }

  PostIt.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    text = map['text'];
  }
}
