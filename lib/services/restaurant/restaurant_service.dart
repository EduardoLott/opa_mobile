class RestaurantService {
  static late int _restaurantId = 1;

  static int getRestaurantId() {
    return _restaurantId;
  }

  static void setRestaurantId(int restaurantId) {
    _restaurantId = restaurantId;
  }
}
