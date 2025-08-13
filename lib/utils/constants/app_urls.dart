class AppUrl{

  /// base url
  static const String baseUrl = 'https://adfirst.pk/Panda_API/API';

  /// Authentication API's
  static const String signIn = '$baseUrl/signin.php';
  static const String verifyOTP = '$baseUrl/verify_otp.php';
  static const String sigInOTP = '$baseUrl/signin_otp.php';
  static const String logout = '$baseUrl/logout.php';
  static const String signUp = '$baseUrl/signup.php';

  /// Vendor Dashboard
  static const String getMenuItem = '$baseUrl/get_menu_items.php?restaurant_id=';
  static const String addMenuItem = '$baseUrl/add_menu_item.php';
  static const String getMenuCategory = '$baseUrl/get_menu_categories.php?restaurant_id=6';
  static const String addMenuCategory = '$baseUrl/menu_categories.php';
  static const String addRestaurant = '$baseUrl/restaurants.php';

  ///
}