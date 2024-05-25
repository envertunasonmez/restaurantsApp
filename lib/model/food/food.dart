class Food {
  int? restaurantId;
  String? ingredients;
  int? id;
  bool? recommended;
  double? price;
  String? imageName;
  String? name;

  Food({
    this.restaurantId,
    this.ingredients,
    this.id,
    this.recommended,
    this.price,
    this.imageName,
    this.name,
  });

  Food.fromJson(Map<String, dynamic> json) {
    restaurantId = json['restaurant_id'];
    ingredients = json['ingredients'];
    id = json['id'];
    recommended = json['recommended'];
    price = json['price'];
    imageName = json['imageName'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['restaurant_id'] = this.restaurantId;
    data['ingredients'] = this.ingredients;
    data['id'] = this.id;
    data['recommended'] = this.recommended;
    data['price'] = this.price;
    data['imageName'] = this.imageName;
    data['name'] = this.name;
    return data;
  }
}
