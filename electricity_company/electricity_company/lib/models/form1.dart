class Form1Model {
  final String fid;
  final String image1;
  final String image2;
  final String image3;

  Form1Model(
      {required this.fid,
      required this.image1,
      required this.image2,
      required this.image3});

  factory Form1Model.fromMap(Map<String, dynamic> map) {
    return Form1Model(
      fid: map['fid'] ?? '',
      image1: map['image1'] ?? '',
      image2: map['image2'] ?? '',
      image3: map['image3'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "fid": fid,
      "image1": image1,
      "image2": image2,
      "image3": image3,
    };
  }
}
