class Offer {
  int? id;
  String? colorHexCode1;
  String? imageName;
  String? logoName;
  String? imageNetworkPath;
  String? logoNetworkPath;
  String? colorHexCode2;
  String? subtitle;
  String? title;

  Offer({
    this.id,
    this.colorHexCode1,
    this.imageName,
    this.imageNetworkPath,this.logoName,
    this.logoNetworkPath,
    this.colorHexCode2,
    this.subtitle,
    this.title,
  });

  Offer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    colorHexCode1 = json['colorHexCode1'];
    imageName = json['imageName'];
    imageNetworkPath = json['imageNetworkPath'];
    logoName = json['logoName'];
    logoNetworkPath = json['logoNetworkPath'];
    colorHexCode2 = json['colorHexCode2'];
    subtitle = json['subtitle'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['colorHexCode1'] = colorHexCode1;
    data['imageName'] = imageName;
    data['imageNetworkPath'] = imageNetworkPath;
    data['logoName'] = logoName;
    data['logoNetworkPath'] = logoNetworkPath;
    data['colorHexCode2'] = colorHexCode2;
    data['subtitle'] = subtitle;
    data['title'] = title;
    return data;
  }
}
