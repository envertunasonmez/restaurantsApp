class AppOrder {
  int? id;
  int? foodId;
  int? restaurantId;
  int? userId;

  AppOrder({this.id, this.foodId, this.restaurantId, this.userId});

  AppOrder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    foodId = json['food_id'];
    restaurantId = json['restaurant_id'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['food_id'] = foodId;
    data['restaurant_id'] = restaurantId;
    data['user_id'] = userId;
    return data;
  }
}
