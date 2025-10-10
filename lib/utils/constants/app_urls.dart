class AppUrl {
  /// base url
  static const String baseUrl = 'https://itgenesis.space/Panda_API/API';

  /// Authentication
  static const String signIn = '$baseUrl/signin.php';
  static const String verifyOTP = '$baseUrl/verify_otp.php';
  static const String sigInOTP = '$baseUrl/signin_otp.php';
  static const String logout = '$baseUrl/logout.php';
  static const String signUp = '$baseUrl/signup.php';

  /// Vendor Dashboard
  /// Items
  static const String getMenuItem =
      '$baseUrl/get_menu_items.php?restaurant_id=';
  static const String addMenuItem = '$baseUrl/add_menu_item.php';
  static const String deleteMenuItem = '$baseUrl/menu_items_delete.php';
  static const String updateMenuItem = '$baseUrl/menu_items_update.php';

  /// Categories
  static const String getCategories = '$baseUrl/categories.php';
  static const String getMenuCategory = '$baseUrl/get_menu_categories.php';
  static const String addMenuCategory = '$baseUrl/menu_categories.php';
  static const String deleteMenuCategory =
      '$baseUrl/menu_categories_delete.php';
  static const String updateMenuCategory =
      '$baseUrl/menu_categories_update.php';

  /// Restaurants
  static const String registerRestaurant = '$baseUrl/restaurants.php';
  static const String deleteRestaurant = '$baseUrl/restaurants_delete.php';
  static const String getRestaurant = '$baseUrl/restaurants_get.php?owner_id=';
  static const String updateRestaurant = '$baseUrl/restaurants_update.php';
  static const String restaurantByCategory =
      '$baseUrl/restaurants_by_category.php';
  static const String restaurantMenu = '$baseUrl/menu_get.php?restaurant_id=';
  static const String newRestaurant = '$baseUrl/new_restaurants_get.php';
  static const String nearByRestaurant = '$baseUrl/restaurants_nearby.php';
  static const String topRestaurant = '$baseUrl/get_top_restaurants.php';
  static const String getRestaurantMenuItem = '$baseUrl/get_menu_items.php';

  /// Profile
  static const String getProfile = '$baseUrl/profile_get.php?id=';
  static const String updateProfile = '$baseUrl/update_profile.php';

  /// Location
  /// location suggestion
  static const String locationSuggestion = '$baseUrl/location_suggestions.php';
  static const String locationDetails = '$baseUrl/location_details.php';
  static const String googleMapLocationDetail =
      'https://maps.googleapis.com/maps/api/geocode/json';
  static const String googleApiKey = 'AIzaSyC-ojZ1Gn7r7TZt_kUn7dE2rcY2xWzMMh0';

  /// Search
  static const String search = '$baseUrl/search.php';

  /// Wish List
  static const String wishList = '$baseUrl/wishlist.php';

  /// CheckOut
  static const String checkout = '$baseUrl/add_orders.php';

  /// Order
  static const String getOrders = '$baseUrl/get_orders.php';
  static const String updateStatus = '$baseUrl/update_order.php';
  static const String getCustomerOrderHistory =
      '$baseUrl/get_order_customer.php';

  /// Income
  static const String getIncome = '$baseUrl/get_income.php';

  /// Performance
  static const String getPerformance = '$baseUrl/get_income.php';

  /// Recommended Items
  static const String recommendedItems = '$baseUrl/item_recommendations.php';

  /// Product Review
  static const String getProductReview = '$baseUrl/get_product_reviews.php';
  static const String addProductReview = '$baseUrl/add_product_review.php';
}
