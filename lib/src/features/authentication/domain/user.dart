import 'package:json_annotation/json_annotation.dart';

/// part 'user.g.dart'; membuaat class User bisa mengakses members privat
/// dalam file yang digenerated
part 'user.g.dart';

/// annotation untuk memberi tahu generator untuk mengenerate kode untuk class ini.
@JsonSerializable()
class User {
  User({
    this.password,
    this.passwordConfirm,
    //required this.email, // jika email tidak ditemukan saat melakukan casting maka akan muncul : flutter: type 'Null' is not a subtype of type 'String' in type cast
    this.email, // yang ini lebih aman jika tidak ditemukan
    this.emailVisibility,
    this.verified,
    this.name,
  });

  // cara ini kurang aman karna jika ada satu saja field yang null maka akan error type null seperti diatas
  //User(
  //  this.password,
  //  this.passwordConfirm,
  //  this.email,
  //  this.emailVisibility,
  //  this.verified,
  //  this.name,
  //);

  // NOTE:  JSON response may contain many different fields, we only need to parse the ones that will begused in the UI.
  String? password;
  String? passwordConfirm;
  String? email;
  bool? emailVisibility;
  bool? verified;
  String? name;

  ///  constructor _$UserFromJson() dihasilkan dari nama constructor mengikuti nama class sumber, yaitu User
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// toJson mengconversi dari nilai properties instance dari class User menjadi JSON
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
