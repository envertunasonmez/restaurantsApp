class Restaurant {
  bool? booked;
  String? city;
  String? country;
  int? id;
  String? image;
  String? imageNetworkPath;
  String? cityCode;
  List<int>? foods;
  String? name;

  Restaurant(
      {this.booked,
        this.city,
        this.country,
        this.id,
        this.image,
        this.imageNetworkPath,
        this.cityCode,
        this.foods,
        this.name});

  Restaurant.fromJson(Map<String, dynamic> json) {
    booked = json['booked'];
    city = json['city'];
    country = json['country'];
    id = json['id'];
    imageNetworkPath = '';
    image = json['image'];
    cityCode = json['city_code'];
    foods = json['foods'].cast<int>();
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['booked'] = booked;
    data['city'] = city;
    data['country'] = country;
    data['id'] = id;
    data['image'] = image;
    data['city_code'] = cityCode;
    data['foods'] = foods;
    data['name'] = name;
    return data;
  }
}
