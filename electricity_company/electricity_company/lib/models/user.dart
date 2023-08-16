class UserModel {
  String fname;
  String sname;
  String tname;
  String lname;
  String id;
  String createdAt;
  String phoneNumber;
  String uid;

  UserModel(
      {required this.fname,
      required this.sname,
      required this.tname,
      required this.lname,
      required this.id,
      required this.createdAt,
      required this.phoneNumber,
      required this.uid});

  //from map
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      fname: map['fname'] ?? '',
      sname: map['sname'] ?? '',
      tname: map['tname'] ?? '',
      lname: map['lname'] ?? '',
      id: map['id'] ?? '',
      createdAt: map['createdAt'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      uid: map['uid'] ?? '',
    );
  }

  //to map
  Map<String, dynamic> toMap() {
    return {
      "fname": fname,
      "sname": sname,
      "tname": tname,
      "lname": lname,
      "id": id,
      "createdAt": createdAt,
      "phoneNumber": phoneNumber,
      "uid": uid,
    };
  }
}
