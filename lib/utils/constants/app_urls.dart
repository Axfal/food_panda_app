class AppUrl {
  /// base url
  static const String baseUrl = 'https://adfirst.pk/Panda_API/API';

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
  static const String getMenuCategory =
      '$baseUrl/get_menu_categories.php?restaurant_id=6';
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

  /// Profile
  static const String getProfile = '$baseUrl/profile_get.php?id=';
  static const String updateProfile = '$baseUrl/update_profile.php';
}
